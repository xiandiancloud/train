<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!doctype html>
<html>
<head>

<base href="<%=basePath%>">
<title>实验</title>

<meta name="viewport" content="width=device-width,initial-scale=1">
<meta name="path_prefix" content="">
<link type="text/css" rel="stylesheet" href="tcss/normalize.css">
<link type="text/css" rel="stylesheet" href="tcss/font-awesome.css">
<link type="text/css" rel="stylesheet" href="tcss/number-polyfill.css">
<link type="text/css" rel="stylesheet" href="tcss/codemirror.css">
<link type="text/css" rel="stylesheet"
	href="tcss/jquery-ui-1.8.22.custom.css">
<link type="text/css" rel="stylesheet" href="tcss/jquery.qtip.min.css">
<link type="text/css" rel="stylesheet" href="tcss/style.css">
<link type="text/css" rel="stylesheet" href="tcss/content.min.css">
<link type="text/css" rel="stylesheet"
	href="tcss/tinymce-studio-content.css">
<link type="text/css" rel="stylesheet" href="tcss/skin.min.css">
<link type="text/css" rel="stylesheet" href="tcss/style-app.css">
<link type="text/css" rel="stylesheet" href="tcss/style-app-extend1.css">
<link rel="stylesheet" type="text/css" href="tcss/jquery.timepicker.css" />
<link href="tcss/style-xmodule.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery-1.11.1.js"></script>
<script type="text/javascript" src="js/index.js"></script>

<script>
$(function() {
	//新建verticalId
	if ("${verticalId}" == -1)
	{
	   edit();
	}
	
});

function hidetrain()
{
	$("#traindiv").hide();
}
function exam_editor_cancel(){
	$("#exam_editor").hide();
	$("#component").show();
	
}
function showtrain(){ 
	//$("#traindiv").show();
	document.getElementById("exam_editor").style.display="block";
	document.getElementById("component").style.display="block";
}
function edit() {
    var input = this.$('.xblock-field-input');
    this.$('.wrapper-xblock-field').addClass('is-editing');
    input.focus().select();            
}
function completeEdit(){
  	var name=this.$('.xblock-field-input').val();
  	this.$('.wrapper-xblock-field').removeClass('is-editing');
  	savever(name);
} 
function delverticaltrain(id)
{
	var data = {id:id};
	$.ajax({
		url:"cms/deleteVerticalTrain.action",
		type:"post",
		data:data,
		success:function(s){
			var a=eval("("+s+")");	
			if (a.sucess=="sucess")
			{
				location.reload();
			}
		}
	});
}
function savever(name)
{
	var sequenticalId = parseInt("${sequentialId}");
	var verticalId = parseInt("${verticalId}");
	var courseId = parseInt("${courseId}");
	var data = {sequenticalId:sequenticalId,verticalId:verticalId,name:name};
	$.ajax({
		url:"cms/createVertical.action",
		type:"post",
		data:data,
		success:function(s){
			var a=eval("("+s+")");	
			if (a.sucess=="sucess")
			{
				location.href = "cms/tottrain.action?courseId="+courseId+"&sequentialId="+sequenticalId+"&verticalId="+a.verticalId;
			}
		}
	});
} 
</script>

<style type="text/css" charset="utf-8">
#tender_window {
	position: absolute;
	top: 20px;
	left: 10px;
	right: 10px;
	margin: auto;
	max-width: 680px;
	height: 715px;
	padding: 3px;
	background:
		url(http://edxedge.tenderapp.com/images/widget/overlay_back.png);
	z-index: 9999;
}

#tender_window iframe {
	border: none;
	width: 100%;
	height: 100%;
}

#tender_window #tender_frame {
	width: 100%;
	height: 100%;
	background: url(http://edxedge.tenderapp.com/images/widget/loader.gif)
		50% 50% no-repeat #fff;
}

#tender_closer {
	position: absolute;
	top: 18px;
	right: 18px;
	color: #fff;
	font-family: Helvetica, Arial, sans-serif;
	font-size: 12px;
	font-weight: bold;
	text-decoration: none;
	border: none;
}

#tender_closer {
	color: #80B3CC
}

#tender_toggler {
	position: absolute;
	top: 100px;
	right: 0px;
	width: 33px;
	height: 105px;
	padding: 3px 0 3px 3px;
	background:
		url(http://edxedge.tenderapp.com/images/widget/overlay_back.png);
}

#tender_toggler_link {
	display: block;
	width: 100%;
	height: 100%;
	text-decoration: none;
	border: none;
	text-indent: -9999px;
	background: #006699
		url(http://edxedge.tenderapp.com/images/widget/tab_text_right.gif)
		!important;
}
</style>
<style type="text/css">
.MathJax_Hover_Frame {
	border-radius: .25em;
	-webkit-border-radius: .25em;
	-moz-border-radius: .25em;
	-khtml-border-radius: .25em;
	box-shadow: 0px 0px 15px #83A;
	-webkit-box-shadow: 0px 0px 15px #83A;
	-moz-box-shadow: 0px 0px 15px #83A;
	-khtml-box-shadow: 0px 0px 15px #83A;
	border: 1px solid #A6D ! important;
	display: inline-block;
	position: absolute
}

.MathJax_Hover_Arrow {
	position: absolute;
	width: 15px;
	height: 11px;
	cursor: pointer
}
</style>
<style type="text/css">
#MathJax_About {
	position: fixed;
	left: 50%;
	width: auto;
	text-align: center;
	border: 3px outset;
	padding: 1em 2em;
	background-color: #DDDDDD;
	color: black;
	cursor: default;
	font-family: message-box;
	font-size: 120%;
	font-style: normal;
	text-indent: 0;
	text-transform: none;
	line-height: normal;
	letter-spacing: normal;
	word-spacing: normal;
	word-wrap: normal;
	white-space: nowrap;
	float: none;
	z-index: 201;
	border-radius: 15px;
	-webkit-border-radius: 15px;
	-moz-border-radius: 15px;
	-khtml-border-radius: 15px;
	box-shadow: 0px 10px 20px #808080;
	-webkit-box-shadow: 0px 10px 20px #808080;
	-moz-box-shadow: 0px 10px 20px #808080;
	-khtml-box-shadow: 0px 10px 20px #808080;
	filter: progid:DXImageTransform.Microsoft.dropshadow(OffX=2, OffY=2,
		Color='gray', Positive='true' )
}

.MathJax_Menu {
	position: absolute;
	background-color: white;
	color: black;
	width: auto;
	padding: 2px;
	border: 1px solid #CCCCCC;
	margin: 0;
	cursor: default;
	font: menu;
	text-align: left;
	text-indent: 0;
	text-transform: none;
	line-height: normal;
	letter-spacing: normal;
	word-spacing: normal;
	word-wrap: normal;
	white-space: nowrap;
	float: none;
	z-index: 201;
	box-shadow: 0px 10px 20px #808080;
	-webkit-box-shadow: 0px 10px 20px #808080;
	-moz-box-shadow: 0px 10px 20px #808080;
	-khtml-box-shadow: 0px 10px 20px #808080;
	filter: progid:DXImageTransform.Microsoft.dropshadow(OffX=2, OffY=2,
		Color='gray', Positive='true' )
}

.MathJax_MenuItem {
	padding: 2px 2em;
	background: transparent
}

.MathJax_MenuArrow {
	position: absolute;
	right: .5em;
	color: #666666
}

.MathJax_MenuActive .MathJax_MenuArrow {
	color: white
}

.MathJax_MenuCheck {
	position: absolute;
	left: .7em
}

.MathJax_MenuRadioCheck {
	position: absolute;
	left: 1em
}

.MathJax_MenuLabel {
	padding: 2px 2em 4px 1.33em;
	font-style: italic
}

.MathJax_MenuRule {
	border-top: 1px solid #CCCCCC;
	margin: 4px 1px 0px
}

.MathJax_MenuDisabled {
	color: GrayText
}

.MathJax_MenuActive {
	background-color: Highlight;
	color: HighlightText
}

.MathJax_Menu_Close {
	position: absolute;
	width: 31px;
	height: 31px;
	top: -15px;
	left: -15px
}
</style>
<style type="text/css">
#MathJax_Zoom {
	position: absolute;
	background-color: #F0F0F0;
	overflow: auto;
	display: block;
	z-index: 301;
	padding: .5em;
	border: 1px solid black;
	margin: 0;
	font-weight: normal;
	font-style: normal;
	text-align: left;
	text-indent: 0;
	text-transform: none;
	line-height: normal;
	letter-spacing: normal;
	word-spacing: normal;
	word-wrap: normal;
	white-space: nowrap;
	float: none;
	box-shadow: 5px 5px 15px #AAAAAA;
	-webkit-box-shadow: 5px 5px 15px #AAAAAA;
	-moz-box-shadow: 5px 5px 15px #AAAAAA;
	-khtml-box-shadow: 5px 5px 15px #AAAAAA;
	filter: progid:DXImageTransform.Microsoft.dropshadow(OffX=2, OffY=2,
		Color='gray', Positive='true' )
}

#MathJax_ZoomOverlay {
	position: absolute;
	left: 0;
	top: 0;
	z-index: 300;
	display: inline-block;
	width: 100%;
	height: 100%;
	border: 0;
	padding: 0;
	margin: 0;
	background-color: white;
	opacity: 0;
	filter: alpha(opacity = 0)
}

#MathJax_ZoomFrame {
	position: relative;
	display: inline-block;
	height: 0;
	width: 0
}

#MathJax_ZoomEventTrap {
	position: absolute;
	left: 0;
	top: 0;
	z-index: 302;
	display: inline-block;
	border: 0;
	padding: 0;
	margin: 0;
	background-color: white;
	opacity: 0;
	filter: alpha(opacity = 0)
}
</style>
<style type="text/css">
.MathJax_Preview {
	color: #888
}

#MathJax_Message {
	position: fixed;
	left: 1em;
	bottom: 1.5em;
	background-color: #E6E6E6;
	border: 1px solid #959595;
	margin: 0px;
	padding: 2px 8px;
	z-index: 102;
	color: black;
	font-size: 80%;
	width: auto;
	white-space: nowrap
}

#MathJax_MSIE_Frame {
	position: absolute;
	top: 0;
	left: 0;
	width: 0px;
	z-index: 101;
	border: 0px;
	margin: 0px;
	padding: 0px
}

.MathJax_Error {
	color: #CC0000;
	font-style: italic
}
</style>
<style type="text/css">
DIV.MathJax_MathML {
	text-align: center;
	margin: .75em 0px
}

.MathJax_MathML {
	font-style: normal;
	font-weight: normal;
	line-height: normal;
	font-size: 100%;
	font-size-adjust: none;
	text-indent: 0;
	text-align: left;
	text-transform: none;
	letter-spacing: normal;
	word-spacing: normal;
	word-wrap: normal;
	white-space: nowrap;
	float: none;
	direction: ltr;
	border: 0;
	padding: 0;
	margin: 0
}

span.MathJax_MathML {
	display: inline
}

div.MathJax_MathML {
	display: block
}

.MathJax_mmlExBox {
	display: block;
	overflow: hidden;
	height: 1px;
	width: 60ex;
	padding: 0;
	border: 0;
	margin: 0
}

[mathvariant="double-struck"] {
	font-family: MathJax_AMS, MathJax_AMS-WEB
}

[mathvariant="script"] {
	font-family: MathJax_Script, MathJax_Script-WEB
}

[mathvariant="fraktur"] {
	font-family: MathJax_Fraktur, MathJax_Fraktur-WEB
}

[mathvariant="bold-script"] {
	font-family: MathJax_Script, MathJax_Caligraphic-WEB;
	font-weight: bold
}

[mathvariant="bold-fraktur"] {
	font-family: MathJax_Fraktur, MathJax_Fraktur-WEB;
	font-weight: bold
}

[mathvariant="monospace"] {
	font-family: monospace
}

[mathvariant="sans-serif"] {
	font-family: sans-serif
}

[mathvariant="bold-sans-serif"] {
	font-family: sans-serif;
	font-weight: bold
}

[mathvariant="sans-serif-italic"] {
	font-family: sans-serif;
	font-style: italic
}

[mathvariant="sans-serif-bold-italic"] {
	font-family: sans-serif;
	font-style: italic;
	font-weight: bold
}

[class="MJX-tex-oldstyle"] {
	font-family: MathJax_Caligraphic, MathJax_Caligraphic-WEB
}

[class="MJX-tex-oldstyle-bold"] {
	font-family: MathJax_Caligraphic, MathJax_Caligraphic-WEB;
	font-weight: bold
}

[class="MJX-tex-caligraphic"] {
	font-family: MathJax_Caligraphic, MathJax_Caligraphic-WEB
}

[class="MJX-tex-caligraphic-bold"] {
	font-family: MathJax_Caligraphic, MathJax_Caligraphic-WEB;
	font-weight: bold
}

@font-face /*1*/ {
	font-family: MathJax_AMS-WEB;
	src:
		url('http://edx-static.s3.amazonaws.com/mathjax-MathJax-727332c/fonts/HTML-CSS/TeX/otf/MathJax_AMS-Regular.otf')
}

@font-face /*2*/ {
	font-family: MathJax_Script-WEB;
	src:
		url('http://edx-static.s3.amazonaws.com/mathjax-MathJax-727332c/fonts/HTML-CSS/TeX/otf/MathJax_Script-Regular.otf')
}

@font-face /*3*/ {
	font-family: MathJax_Fraktur-WEB;
	src:
		url('http://edx-static.s3.amazonaws.com/mathjax-MathJax-727332c/fonts/HTML-CSS/TeX/otf/MathJax_Fraktur-Regular.otf')
}

@font-face /*4*/ {
	font-family: MathJax_Caligraphic-WEB;
	src:
		url('http://edx-static.s3.amazonaws.com/mathjax-MathJax-727332c/fonts/HTML-CSS/TeX/otf/MathJax_Caligraphic-Regular.otf')
}

@font-face /*5*/ {
	font-family: MathJax_Fraktur-WEB;
	font-weight: bold;
	src:
		url('http://edx-static.s3.amazonaws.com/mathjax-MathJax-727332c/fonts/HTML-CSS/TeX/otf/MathJax_Fraktur-Bold.otf')
}

@font-face /*6*/ {
	font-family: MathJax_Caligraphic-WEB;
	font-weight: bold;
	src:
		url('http://edx-static.s3.amazonaws.com/mathjax-MathJax-727332c/fonts/HTML-CSS/TeX/otf/MathJax_Caligraphic-Bold.otf')
}
</style>
<script type="text/javascript" charset="utf-8" async=""
	data-requirecontext="_" data-requiremodule="date"
	src="/static/acf03d7/js/vendor/date.js"></script>
<script type="text/javascript" charset="utf-8" async=""
	data-requirecontext="_" data-requiremodule="js/models/metadata"
	src="/static/acf03d7/js/models/metadata.js"></script>
<script type="text/javascript" charset="utf-8" async=""
	data-requirecontext="_" data-requiremodule="js/views/abstract_editor"
	src="/static/acf03d7/js/views/abstract_editor.js"></script>
<script type="text/javascript" charset="utf-8" async=""
	data-requirecontext="_" data-requiremodule="js/models/uploads"
	src="/static/acf03d7/js/models/uploads.js"></script>
<script type="text/javascript" charset="utf-8" async=""
	data-requirecontext="_" data-requiremodule="js/views/uploads"
	src="/static/acf03d7/js/views/uploads.js"></script>
<script type="text/javascript" charset="utf-8" async=""
	data-requirecontext="_"
	data-requiremodule="js/views/video/transcripts/metadata_videolist"
	src="/static/acf03d7/js/views/video/transcripts/metadata_videolist.js"></script>
<script type="text/javascript" charset="utf-8" async=""
	data-requirecontext="_"
	data-requiremodule="js/views/video/translations_editor"
	src="/static/acf03d7/js/views/video/translations_editor.js"></script>
<style type="text/css">
.MathJax_Display {
	text-align: center;
	margin: 1em 0em;
	position: relative;
	display: block;
	width: 100%
}

.MathJax .merror {
	background-color: #FFFF88;
	color: #CC0000;
	border: 1px solid #CC0000;
	padding: 1px 3px;
	font-style: normal;
	font-size: 90%
}

#MathJax_Tooltip {
	background-color: InfoBackground;
	color: InfoText;
	border: 1px solid black;
	box-shadow: 2px 2px 5px #AAAAAA;
	-webkit-box-shadow: 2px 2px 5px #AAAAAA;
	-moz-box-shadow: 2px 2px 5px #AAAAAA;
	-khtml-box-shadow: 2px 2px 5px #AAAAAA;
	filter: progid:DXImageTransform.Microsoft.dropshadow(OffX=2, OffY=2,
		Color='gray', Positive='true' );
	padding: 3px 4px;
	z-index: 401;
	position: absolute;
	left: 0;
	top: 0;
	width: auto;
	height: auto;
	display: none
}

.MathJax {
	display: inline;
	font-style: normal;
	font-weight: normal;
	line-height: normal;
	font-size: 100%;
	font-size-adjust: none;
	text-indent: 0;
	text-align: left;
	text-transform: none;
	letter-spacing: normal;
	word-spacing: normal;
	word-wrap: normal;
	white-space: nowrap;
	float: none;
	direction: ltr;
	border: 0;
	padding: 0;
	margin: 0
}

.MathJax img,.MathJax nobr,.MathJax a {
	border: 0;
	padding: 0;
	margin: 0;
	max-width: none;
	max-height: none;
	vertical-align: 0;
	line-height: normal;
	text-decoration: none
}

img.MathJax_strut {
	border: 0 !important;
	padding: 0 !important;
	margin: 0 !important;
	vertical-align: 0 !important
}

.MathJax span {
	display: inline;
	position: static;
	border: 0;
	padding: 0;
	margin: 0;
	vertical-align: 0;
	line-height: normal;
	text-decoration: none
}

.MathJax nobr {
	white-space: nowrap ! important
}

.MathJax img {
	display: inline ! important;
	float: none ! important
}

.MathJax * {
	transition: none;
	-webkit-transition: none;
	-moz-transition: none;
	-ms-transition: none;
	-o-transition: none
}

.MathJax_Processing {
	visibility: hidden;
	position: fixed;
	width: 0;
	height: 0;
	overflow: hidden
}

.MathJax_Processed {
	display: none !important
}

.MathJax_ExBox {
	display: block;
	overflow: hidden;
	width: 1px;
	height: 60ex
}

.MathJax .MathJax_EmBox {
	display: block;
	overflow: hidden;
	width: 1px;
	height: 60em
}

.MathJax .MathJax_HitBox {
	cursor: text;
	background: white;
	opacity: 0;
	filter: alpha(opacity = 0)
}

.MathJax .MathJax_HitBox * {
	filter: none;
	opacity: 1;
	background: transparent
}

#MathJax_Tooltip * {
	filter: none;
	opacity: 1;
	background: transparent
}

@font-face {
	font-family: MathJax_Main;
	src:
		url('http://edx-static.s3.amazonaws.com/mathjax-MathJax-727332c/fonts/HTML-CSS/TeX/woff/MathJax_Main-Regular.woff')
		format('woff'),
		url('http://edx-static.s3.amazonaws.com/mathjax-MathJax-727332c/fonts/HTML-CSS/TeX/otf/MathJax_Main-Regular.otf')
		format('opentype')
}

@font-face {
	font-family: MathJax_Main;
	src:
		url('http://edx-static.s3.amazonaws.com/mathjax-MathJax-727332c/fonts/HTML-CSS/TeX/woff/MathJax_Main-Bold.woff')
		format('woff'),
		url('http://edx-static.s3.amazonaws.com/mathjax-MathJax-727332c/fonts/HTML-CSS/TeX/otf/MathJax_Main-Bold.otf')
		format('opentype');
	font-weight: bold
}

@font-face {
	font-family: MathJax_Main;
	src:
		url('http://edx-static.s3.amazonaws.com/mathjax-MathJax-727332c/fonts/HTML-CSS/TeX/woff/MathJax_Main-Italic.woff')
		format('woff'),
		url('http://edx-static.s3.amazonaws.com/mathjax-MathJax-727332c/fonts/HTML-CSS/TeX/otf/MathJax_Main-Italic.otf')
		format('opentype');
	font-style: italic
}

@font-face {
	font-family: MathJax_Math;
	src:
		url('http://edx-static.s3.amazonaws.com/mathjax-MathJax-727332c/fonts/HTML-CSS/TeX/woff/MathJax_Math-Italic.woff')
		format('woff'),
		url('http://edx-static.s3.amazonaws.com/mathjax-MathJax-727332c/fonts/HTML-CSS/TeX/otf/MathJax_Math-Italic.otf')
		format('opentype');
	font-style: italic
}

@font-face {
	font-family: MathJax_Caligraphic;
	src:
		url('http://edx-static.s3.amazonaws.com/mathjax-MathJax-727332c/fonts/HTML-CSS/TeX/woff/MathJax_Caligraphic-Regular.woff')
		format('woff'),
		url('http://edx-static.s3.amazonaws.com/mathjax-MathJax-727332c/fonts/HTML-CSS/TeX/otf/MathJax_Caligraphic-Regular.otf')
		format('opentype')
}

@font-face {
	font-family: MathJax_Size1;
	src:
		url('http://edx-static.s3.amazonaws.com/mathjax-MathJax-727332c/fonts/HTML-CSS/TeX/woff/MathJax_Size1-Regular.woff')
		format('woff'),
		url('http://edx-static.s3.amazonaws.com/mathjax-MathJax-727332c/fonts/HTML-CSS/TeX/otf/MathJax_Size1-Regular.otf')
		format('opentype')
}

@font-face {
	font-family: MathJax_Size2;
	src:
		url('http://edx-static.s3.amazonaws.com/mathjax-MathJax-727332c/fonts/HTML-CSS/TeX/woff/MathJax_Size2-Regular.woff')
		format('woff'),
		url('http://edx-static.s3.amazonaws.com/mathjax-MathJax-727332c/fonts/HTML-CSS/TeX/otf/MathJax_Size2-Regular.otf')
		format('opentype')
}

@font-face {
	font-family: MathJax_Size3;
	src:
		url('http://edx-static.s3.amazonaws.com/mathjax-MathJax-727332c/fonts/HTML-CSS/TeX/woff/MathJax_Size3-Regular.woff')
		format('woff'),
		url('http://edx-static.s3.amazonaws.com/mathjax-MathJax-727332c/fonts/HTML-CSS/TeX/otf/MathJax_Size3-Regular.otf')
		format('opentype')
}

@font-face {
	font-family: MathJax_Size4;
	src:
		url('http://edx-static.s3.amazonaws.com/mathjax-MathJax-727332c/fonts/HTML-CSS/TeX/woff/MathJax_Size4-Regular.woff')
		format('woff'),
		url('http://edx-static.s3.amazonaws.com/mathjax-MathJax-727332c/fonts/HTML-CSS/TeX/otf/MathJax_Size4-Regular.otf')
		format('opentype')
}

.MathJax .noError {
	vertical-align:;
	font-size: 90%;
	text-align: left;
	color: black;
	padding: 1px 3px;
	border: 1px solid
}
</style>
<script type="text/javascript" charset="utf-8" async=""
	data-requirecontext="_"
	data-requiremodule="js/views/video/transcripts/utils"
	src="/static/acf03d7/js/views/video/transcripts/utils.js"></script>
<script type="text/javascript" charset="utf-8" async=""
	data-requirecontext="_"
	data-requiremodule="js/views/video/transcripts/message_manager"
	src="/static/acf03d7/js/views/video/transcripts/message_manager.js"></script>
<script type="text/javascript" charset="utf-8" async=""
	data-requirecontext="_"
	data-requiremodule="js/views/video/transcripts/file_uploader"
	src="/static/acf03d7/js/views/video/transcripts/file_uploader.js"></script>
<script type="text/javascript" charset="utf-8" async=""
	data-requirecontext="_" data-requiremodule="jquery.ajaxQueue"
	src="/static/acf03d7/js/vendor/jquery.ajaxQueue.js"></script>
</head>


<body
	class="is-signedin course container view-container hide-wip lang_en js">
	<div
		style="visibility: hidden; overflow: hidden; position: absolute; top: 0px; height: 1px; width: auto; padding: 0px; border: 0px; margin: 0px; text-align: left; text-indent: 0px; text-transform: none; line-height: normal; letter-spacing: normal; word-spacing: normal;">
		<div id="MathJax_Hidden"></div>
	</div>
	<div id="MathJax_Message" style="display: none;"></div>
	<a class="nav-skip" href="#content">Skip to this view's content</a>
	<script type="text/javascript" src="tjs/require.js"></script>
	<!-- view -->
	<div class="wrapper wrapper-view">
		<jsp:include page="ttheader.jsp"></jsp:include>
		<div id="page-alert"></div>
		<div id="content">
			<div class="wrapper-mast wrapper">
				<header class="mast has-actions has-navigation has-subtitle">
					<div class="page-header">
						<small class="navigation navigation-parents subtitle"> <a
							
							class="navigation-item navigation-link navigation-parent">单元名</a>
							<!-- <a
							href="#"
							class="navigation-item navigation-link navigation-parent">小节</a> -->
						</small>
						<div data-field-display-name="Display Name" data-field="display_name" class="wrapper-xblock-field incontext-editor is-editable">
							<h1 id="t11" class="page-header-title xblock-field-value incontext-editor-value">
								<c:out value="${vertical.name}" default="单元"></c:out> 
							</h1>
							<div class="incontext-editor-action-wrapper">
								<a title="Edit the name" class="action-edit action-inline xblock-field-value-edit incontext-editor-open-action" onclick="edit()"> 
									<i class="icon-pencil"> </i>
										<span class="sr">Edit</span> 
								</a>
							</div>

							<div class="xblock-string-field-editor incontext-editor-form">
								<form>
									<label>
										<span class="sr">Edit Display Name	(required)</span> 
										<input type="text" title="Edit the name" data-metadata-name="display_name" class="xblock-field-input incontext-editor-input" value="<c:out value='${vertical.name}' default='单元'></c:out>" onblur="completeEdit()"/>
									</label>
									<button type="submit" name="submit" class="sr action action-primary">Save</button>
									<button type="button" name="cancel" class="sr action action-secondary">取消</button>
								</form>
							</div>
						</div>
					</div>

				</header>
			</div>

			<div class="wrapper-content wrapper">
				<div class="inner-wrapper">
					<section class="content-area">
						<article class="content-primary">
							<div class="container-message wrapper-message"></div>
							<section class="wrapper-xblock level-page studio-xblock-wrapper"
								data-locator="#"
								data-course-key="Cetc55/Iaas-001/2014-01-01">
								<header class="xblock-header xblock-header-vertical">
									<div class="xblock-header-primary">
										<div class="header-details">
											<span class="xblock-display-name">单元</span>
										</div>
										<div class="header-actions">
											<ul class="actions-list">
											</ul>
										</div>
									</div>
								</header>
								<article class="xblock-render">
									<div
										class="xblock xblock-author_view xmodule_display xmodule_VerticalModule xblock-initialized"
										data-runtime-class="PreviewRuntime"
										data-init="XBlockToXModuleShim" data-runtime-version="1"
										data-usage-id="#"
										data-type="None" data-block-type="vertical">
										<c:forEach var="vt" items="${vtlist}">
										<ol class="reorderable-container ui-sortable" style="">
										 <li class="studio-xblock-wrapper is-draggable" data-locator="#" data-course-key="">

										    <section class="wrapper-xblock level-element ">
										<header class="xblock-header xblock-header-problem">
										    <div class="xblock-header-primary">
										        <div class="header-details">
										            <span class="xblock-display-name">实验名：${vt.train.name}</span>
										        </div>
										        <div class="header-actions">
										            <ul class="actions-list">
									                        <li class="action-item action-edit">
									                            <a href="javascript:void(0);" 
									                            onclick="showtrain();inittrainbyid(${vt.train.id});" class="edit-button action-button">
									                                <i class="icon-pencil"></i>
									                                <span class="action-button-text">编辑</span>
									                            </a>
									                        </li>
										                    <li class="action-item action-delete">
										                        <a href="javascript:void(0);" data-tooltip="删除" onclick="delverticaltrain(${vt.id});" class="delete-button action-button">
										                        <i class="icon-trash"></i>
										                        <span class="sr">删除</span>
										                        </a>
										                    </li>
										            </ul>
										        </div>
										    </div>
										 </header>
										    <article class="xblock-render">
										    ${vt.train.conContent}
										    </article>
										
										    </section>
										        </li>
										</ol>
										</c:forEach>
										<%-- <div id="traindiv" style="display:none;">
										<jsp:include page="experiment.jsp"></jsp:include>
										</div> --%>
										 <div  id="exam_editor" style="display:none;">
										    <div class="wrapper wrapper-modal-window wrapper-modal-window-edit-xblock" aria-describedby="modal-window-description" aria-labelledby="modal-window-title" aria-hidden="" role="dialog">
										    <div class="modal-window-overlay"></div>
										    <div class="modal-window modal-editor confirm modal-lg modal-type-discussion" style="top: 31.39999999999999px; left: 202.5px;position:fixed;">
										        <div class="edit-xblock-modal">
										            <div class="modal-header">
										                <h2 class="title modal-window-title">编辑：试卷</h2>
										                <ul class="editor-modes action-list action-modes">
										                </ul>
										            </div>
														<div class="modal-content">
														
															  <div class="xblock-editor">
																	<div class="xblock xblock-studio_view xmodule_edit xmodule_VideoDescriptor xblock-initialized">
																		<div class="wrapper-comp-editor">
																			 <section class="editor-with-tabs">
																			 	<div id="traindiv" style="display:block;">
																				<jsp:include page="experiment.jsp"></jsp:include>
																				</div>
																			 </section>
																		</div>
																	</div>
																</div>
																<%-- <div id="traindiv" style="display:block;">
																<jsp:include page="experiment.jsp"></jsp:include>
																</div> --%>
															</div>
															</div>
										            <div class="modal-actions" style="display: block;">
										                <h3 class="sr">Actions</h3>
										                <ul>
										    <li class="action-item">
										    <a href="javascript:void(0);" class="button action-primary action-save" onclick="updatetrain();">保存</a>
										</li>
										    <li class="action-item">
										    <a  class="button  action-cancel" onclick="exam_editor_cancel()">取消</a>
										</li>
										
										</ul>
										            </div>
										        </div>
										    </div>
										</div>

										<div class="add-xblock-component new-component-item adding">
											<div class="new-component" id="component">
												<h5>增加实验</h5>
												<ul class="new-component-type">
<!-- 													<li><a
														class="multiple-templates add-xblock-component-button"
														data-type="problem"> <span
															class="large-template-icon large-problem-icon"></span> <span
															class="name">问题</span>
													</a></li> -->
													<li><a onclick="showtrain();resettrain();"
														class="multiple-templates add-xblock-component-button"
														data-type="experiment"> <span
															class="large-template-icon large-experiment-icon"></span>
															<span class="name">实验</span>
													</a></li>
												</ul>
											</div>
										</div>

									</div>

								</article>

							</section>
							<div class="ui-loading is-hidden">
								<p>
									<span class="spin"><i class="icon-refresh"></i></span> <span
										class="copy">Loading...</span>
								</p>
							</div>
						</article>
						<aside class="content-supplementary" role="complimentary" style="margin-top:7px;">
							<div id="publish-unit">
								<div class="bit-publishing is-staff-only is-scheduled">
									<h3 class="bar-mod-title pub-status">
										<span class="sr"></span>
										我在这个页面能做什么？
									</h3>
									<div class="wrapper-last-draft bar-mod-content">
										<p class="copy meta" style="line-height:25px;">
											<span class="date">您可以在单元中添加新的实验，定义实验编号、实验名称,实验分值、上传判分脚本。</span><span class="user">您还修改实验名称、实验题目、实验答案.</span>
										</p>
										<p class="copy meta"><span>此外，您可以在一个单元中添加多个实验，或者删冗余余的实验。</span></p>
									</div>
									<div class="wrapper-release bar-mod-content">
										<!-- <h5 class="title">此外:</h5> -->
										<p class="copy">
											<!-- <span class="release-date">您还可以返回到大纲列表</span> -->
											 <span class="release-with"></span>
										</p>
									</div>
									<div class="wrapper-pub-actions bar-mod-actions">
										<ul class="action-list">
											<li class="action-item"><!--  <a
												class="action-publish action-primary " href="">Publish </a> -->
											</li>
											<li class="action-item"><!-- <a
												class="action-discard action-secondary " href="">Discard
													Changes </a> --></li>
										</ul>
									</div>
								</div>

							</div>
							<div id="publish-history" class="unit-publish-history">


								<div class="wrapper-last-publish">
									<p class="copy">
										<!-- Last published --> <!-- 最后一次出版于 --><span class="date"><!-- Aug 20, 2014 at 01:21
											UTC --><!-- 2014年8月20号在utc上被员工出版 --></span> <!-- by --> <span class="user"><!-- staff --></span>
									</p>
								</div>

							</div>
							<!-- </ol> -->
				</div>
			<!-- 	</li>
				</ol> -->
			</div>
			<!-- </li>
			</ol> -->
		</div>
	</div>
	<!-- </ol>
	</div>
	</div>
	</div>
	</div>
	</aside>
	</section>
	</div>
	</div>

	</div> -->

	<div class="wrapper-sock wrapper">
		<ul class="list-actions list-cta">
			<li class="action-item"><a href="#sock"
				class="cta cta-show-sock"><i class="icon-question-sign"></i> <span
					class="copy">向云平台寻求帮助?</span></a></li>
		</ul>

	</div>

	<jsp:include page="tfooter.jsp"></jsp:include>

	<!-- </div> -->




</body>
</html>
