-- Copyright (C) 2014 Robin Trew
--
-- Permission is hereby granted, free of charge, 
-- to any person obtaining a copy of this software 
-- and associated documentation files (the "Software"), 
-- to deal in the Software without restriction, 
-- including without limitation the rights to use, copy, 
-- modify, merge, publish, distribute, sublicense, 
-- and/or sell copies of the Software, and to permit persons 
-- to whom the Software is furnished to do so, 
-- subject to the following conditions:

-- *******
-- The above copyright notice and this permission notice 
-- shall be included in ALL copies 
-- or substantial portions of the Software.
-- *******

-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, 
-- EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES 
-- OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. 
-- IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, 
-- DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, 
-- TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE 
-- OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
property pTitle : "Import OPML file as FoldingText outline"
property pVer : "2.1"
property pAuthor : "Rob Trew"

-- OPTIONS
property plngHashLevels : 2 -- Top N levels of the outline as MD hash headings ?  (0-6)
property pblnMatchExpansion : true -- Preserve the OPML expansion state in the FT outline ?

--EDIT TO SPECIFY ANY FILTERING / ADJUSTMENT OF (ATTRIBUTE to TAG) TRANSLATIONS
-- E.G 1. if 'next' has the value 0 create no tag. If 'next' has any other value, creat a @next tag but discard the value
-- E.G 2. Drop 'done' of 0, If it has the value 1 or 2, create a plain @done tag, for other values create full @done(value) tag
-- The two rules above are encoded as:
--property plstFilterMaps : {next:{|0|:"", |*|:"@next"}, done:{|0|:"", |1|:"@done", |1|:"@done"}}

-- i.e. The default is that attribute:value → @attr(value)
-- for special treatment of particular values of paricular tags, add a key for that tag to the record below,
-- and in the keyed record, create create any value:output pairs that you need.
property plstTagMaps : {next:{|0|:"", |1|:"@next", |2|:"@next"}, done:{|0|:"", |1|:"@done"}}

property pstrJS : "
function (editor, options) {

	var oTree = editor.tree(),
		dctTagMaps = options.tagmaps,
		dctMap, strTrans, blnTrans = false,
		oRoot = oTree.root,
		lstNodes, oNode,
		lstOPML = options.opml,
		lngMaxHash = options.hashlevels,
		iLine = 0,
		lstFolds = [],
		lstExpand = options.expansion.split(/\\s*,\\s*/).map(
			function (strN) {
				return parseInt(strN, 10);
			}),
		blnFold = options.keepfolds,
		strID;

	function makeOutline(oParent, lstOutln, lngLevel) {
		var oNode, oNote,
			dctOutln,
			lstTag,
			lstKeyValue, strKey, strValue,
			lstNotes,
			lstChiln, lngChiln,
			strTag, strNotes, strPara,
			lngNextLevel = lngLevel + 1,
			j, k, lngPara,
			iIndex,
			strType;

		for (var lng = lstOutln.length, i = 0; i < lng; i++) {

			// PREPARE AN FT NODE WITH THE TEXT AND TYPE REQUIRED,

			dctOutln = lstOutln[i];
			lstChiln = dctOutln.chiln;
			lngChiln = lstChiln.length;

			oNode = oTree.createNode(dctOutln.txt, false);
			if (lngLevel <= lngMaxHash) oNode.setType('heading');
			else oNode.setType('unordered');

			// CONVERT ANY OPML ATTRIBUTES TO @key(value) TAGS,

			lstTag = dctOutln.attribs;
			for (j = lstTag.length; j--;) {
				blnTrans = false;
				lstKeyValue = lstTag[j];
				strKey = lstKeyValue[0];
				strValue = lstKeyValue[1];
				
				// ANY TAG FORMAT TRANSLATIONS FOR THIS ATTRIBUTE ?
				dctMap = dctTagMaps[strKey];
				if (dctMap) {
					strTrans = dctMap[strValue];
					strType = typeof strTrans;
					blnTrans = (strType === 'string');
					
					// TRANSLATE OR SKIP FOR THIS VALUE
					if (blnTrans && strTrans)
						oNode.setLine(oNode.line() + ' ' + strTrans);
				}
				//DEFAULT TO attr@(value) TAG 
				if (!blnTrans) oNode.addTag(strKey, strValue);
			}

			// ADD THE LINE AND ANY _NOTE PARAS TO FT, 
			oParent.appendChild(oNode);

			//Folding if required (or just adding to fold list)
			if (blnFold && lngChiln) {
				iIndex = lstExpand.indexOf(iLine);
				if (iIndex === -1) lstFolds.push(oNode.id);
			}
			iLine++;

			strNotes = dctOutln.note;
			if (strNotes) {
				lstNotes = strNotes.split('\\n');
				lngPara = lstNotes.length;
				for (k = 0; k < lngPara; k++) {
					oNote = oTree.createNode(lstNotes[k], false);
					oNote.setType('body');
					oNode.appendChild(oNote);
				}
			}

			// RECURSING WITH ANY CHILDREN
			if (lngChiln) makeOutline(oNode, lstChiln, lngNextLevel);
		}
	}

	// IMPORT THE OUTLINE,

	oTree.beginUpdates();
	makeOutline(oRoot, lstOPML, 1);
	oTree.endUpdates();
	oTree.ensureClassified();

	// REPRODUCE THE FOLDING PATTERN (IF REQUIRED BY pblnMatchExpansion ABOVE)
	if (blnFold) {
		for (var f = 0, lngFolds = lstFolds.length; f < lngFolds; f++) {
			strID = lstFolds[f];
			oNode = oTree.nodeForID(strID);
			if (!editor.nodeIsHiddenInFold(oNode))
				editor.collapseNode(oNode);
		}
	}

	// AND REPORT ANY SUCCESS
	return options.title + ' imported';
}
"

on run
	-- CHOOSE A FILE,
	set oFile to choose file with prompt "OPML file:" -- default location (path to desktop)
	try
		set fOPML to oFile as string
	on error
		return "not found"
	end try
	
	-- LOOK FOR AN OPML OUTLINE IN IT,
	set {lstNodes, strTitle, strExpand} to opmlTree(fOPML)
	
	-- AND WRITE OUT ANY OUTLINE FOUND AS A NEW FOLDINGTEXT OUTLINE:
	-- with TEXT attributes as headings / unordered list items
	-- _NOTE attributes as body text, 
	-- and OTHER attributes as @key(value) tags
	if lstNodes ≠ {} then
		tell application "FoldingText"
			activate
			set oDoc to make new document
			set recOptions to {hashlevels:plngHashLevels, opml:lstNodes, title:strTitle, expansion:strExpand, keepfolds:pblnMatchExpansion, tagmaps:plstTagMaps}
			tell oDoc
				set varResult to (evaluate script pstrJS with options recOptions)
			end tell
		end tell
	else
		set varResult to "Zero OPML nodes parsed - " & strTitle
	end if
	return varResult
end run

-- filePath → nested nodes {txt:String,  chiln:nodes,  attribs:(List of pairs)}
on opmlTree(strFilePath)
	set strExpand to ""
	set strTitle to ""
	set lstNodes to {}
	tell application "System Events"
		tell XML file strFilePath
			tell XML element 1
				tell XML element "head"
					try
						set strExpand to (value of XML element "expansionState")
						if strExpand = missing value then set strExpand to ""
					end try
					try
						set strTitle to (value of XML element "title")
						if strTitle = "undefined" then set strTitle to "opml"
					end try
				end tell
				
				try
					tell XML element "body"
						set lstOutline to XML elements where its name is "outline"
						set lstNodes to my readOPML(lstOutline)
					end tell
				on error
					set strMsg to "Couldn't parse " & POSIX path of (strFilePath as alias) & " as OPML"
					activate
					display dialog strMsg buttons {"OK"} default button "OK" with title pTitle & "  ver. " & pVer
					return {{}, strMsg, ""}
				end try
			end tell
		end tell
	end tell
	return {lstNodes, strTitle, strExpand}
end opmlTree

-- Recursive read of a peer group of <outline> nodes
on readOPML(lstElement)
	using terms from application "System Events"
		set lstNode to {}
		repeat with varElem in lstElement
			set recNode to {txt:"", |note|:"", chiln:{}, attribs:{}}
			set lstAttribs to {}
			set oElem to contents of varElem
			set lstXMLAttribs to (XML attributes of oElem)
			repeat with varAttrib in lstXMLAttribs
				tell (contents of varAttrib) to set {strName, strValue} to {its name, its value}
				if (strName ≠ "text") then
					if strName ≠ "_note" then
						set end of lstAttribs to {strName, strValue}
					else
						set |note| of recNode to strValue
					end if
				else
					set txt of recNode to strValue
				end if
			end repeat
			if lstAttribs ≠ {} then set attribs of recNode to lstAttribs
			set lstChiln to (XML elements of oElem where its name is "outline")
			if lstChiln ≠ {} then set chiln of recNode to my readOPML(lstChiln)
			set end of lstNode to recNode
		end repeat
		return lstNode
	end using terms from
end readOPML
