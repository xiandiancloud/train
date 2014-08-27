<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!doctype html>
<!--[if IE 7]><html class="ie7 lte9 lte8 lte7" lang="zh-cn"><![endif]-->
<!--[if IE 8]><html class="ie8 lte9 lte8" lang="zh-cn"><![endif]-->
<!--[if IE 9]><html class="ie9 lte9" lang="zh-cn"><![endif]-->
<!--[if gt IE 9]><!-->
<html lang="zh-cn"><!--<![endif]-->
  <head>
  	<base href="<%=basePath%>">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>课程大纲 |edX Demonstration Course|edX Studio</title>

    <meta name="viewport" content="width=device-width,initial-scale=1">
    <meta name="path_prefix" content="">
	<link type="text/css" rel="stylesheet" href="tcss/normalize.css">
	<link type="text/css" rel="stylesheet" href="tcss/font-awesome.css">
	<link type="text/css" rel="stylesheet" href="tcss/number-polyfill.css">
	<link type="text/css" rel="stylesheet" href="tcss/codemirror.css">
	<link type="text/css" rel="stylesheet" href="tcss/jquery-ui-1.8.22.custom.css">
	<link type="text/css" rel="stylesheet" href="tcss/jquery.qtip.min.css">
	<link type="text/css" rel="stylesheet" href="tcss/style.css">
	<link type="text/css" rel="stylesheet" href="tcss/content.min.css">
	<link type="text/css" rel="stylesheet" href="tcss/tinymce-studio-content.css">
	<link type="text/css" rel="stylesheet" href="tcss/skin.min.css">
	<link type="text/css" rel="stylesheet" href="tcss/style-app.css">
	<link type="text/css" rel="stylesheet" href="tcss/style-app-extend1.css">
	<link type="text/css" rel="stylesheet" href="tcss/style-xmodule.css">
	<link rel="stylesheet" type="text/css" href="tcss/jquery.timepicker.css" />


	<script type="text/javascript" src="js/jquery-1.11.1.js"></script>
	<script type="text/javascript" src="js/index.js"></script>
	<script type="text/javascript" src="js/jquery-ui.js"></script> 
	
 </head>

  <body class="is-signedin course view-outline hide-wip lang_zh-cn">
    <a class="nav-skip" href="#content">跳过本内容页</a>

   
    <!-- view -->
<div class="wrapper wrapper-view">
        
<div class="wrapper-header wrapper" id="view-top">
  <header class="primary" role="banner">

    <div class="wrapper wrapper-l">
      <h1 class="branding"><a href="/"><img src="" alt="edX Studio" /></a></h1>

      
      <h2 class="info-course">
        <span class="sr">当前课程</span>
        <a class="course-link" href="/course/edX/Open_DemoX/edx_demo_course">
          <span class="course-org">edX</span><span class="course-number">Open_DemoX</span>
          <span class="course-title" title="edX Demonstration Course">edX Demonstration Course</span>
        </a>
      </h2>

      <nav class="nav-course nav-dd ui-left">
        <h2 class="sr">edX Demonstration Course导航：</h2>
        <ol>
          <li class="nav-item nav-course-courseware">
            <h3 class="title"><span class="label"><span class="label-prefix sr">课程 </span>内容</span> <i class="icon-caret-down ui-toggle-dd"></i></h3>

            <div class="wrapper wrapper-nav-sub">
              <div class="nav-sub">
                <ul>
                  <li class="nav-item nav-course-courseware-outline">
                    <a href="/course/edX/Open_DemoX/edx_demo_course">大纲</a>
                  </li>
                  <li class="nav-item nav-course-courseware-updates">
                    <a href="/course_info/edX/Open_DemoX/edx_demo_course">更新</a>
                  </li>
                  <li class="nav-item nav-course-courseware-pages">
                    <a href="/tabs/edX/Open_DemoX/edx_demo_course">页面</a>
                  </li>
                  <li class="nav-item nav-course-courseware-uploads">
                    <a href="/assets/edX/Open_DemoX/edx_demo_course/">文件&amp;上传</a>
                  </li>
                  <li class="nav-item nav-course-courseware-textbooks">
                    <a href="/textbooks/edX/Open_DemoX/edx_demo_course">教材</a>
                  </li>
                </ul>
              </div>
            </div>
          </li>

          <li class="nav-item nav-course-settings">
            <h3 class="title"><span class="label"><span class="label-prefix sr">课程 </span>设置</span> <i class="icon-caret-down ui-toggle-dd"></i></h3>

            <div class="wrapper wrapper-nav-sub">
              <div class="nav-sub">
                <ul>
                  <li class="nav-item nav-course-settings-schedule">
                    <a href="/settings/details/edX/Open_DemoX/edx_demo_course">日程 &amp; 细节</a>
                  </li>
                  <li class="nav-item nav-course-settings-grading">
                    <a href="/settings/grading/edX/Open_DemoX/edx_demo_course">评分</a>
                  </li>
                  <li class="nav-item nav-course-settings-team">
                    <a href="/course_team/edX/Open_DemoX/edx_demo_course/">课程团队</a>
                  </li>
                  <li class="nav-item nav-course-settings-advanced">
                    <a href="/settings/advanced/edX/Open_DemoX/edx_demo_course">高级设置</a>
                  </li>
                </ul>
              </div>
            </div>
          </li>

          <li class="nav-item nav-course-tools">
            <h3 class="title"><span class="label">工具</span> <i class="icon-caret-down ui-toggle-dd"></i></h3>

            <div class="wrapper wrapper-nav-sub">
              <div class="nav-sub">
                <ul>
                  <li class="nav-item nav-course-tools-checklists">
                    <a href="/checklists/edX/Open_DemoX/edx_demo_course/">核对表</a>
                  </li>
                  <li class="nav-item nav-course-tools-import">
                    <a href="/import/edX/Open_DemoX/edx_demo_course">导入</a>
                  </li>
                  <li class="nav-item nav-course-tools-export">
                    <a href="/export/edX/Open_DemoX/edx_demo_course">导出</a>
                  </li>
                </ul>
              </div>
            </div>
          </li>
        </ol>
      </nav>
    </div>

    <div class="wrapper wrapper-r">
      <nav class="nav-account nav-is-signedin nav-dd ui-right">
        <h2 class="sr">帮助 &amp; 账户导航</h2>
        <ol>
          <li class="nav-item nav-account-help">
            <h3 class="title"><span class="label"><a href="http://edx.readthedocs.org/projects/edx-partner-course-staff/en/latest/developing_course/course_outline.html" title="Contextual Online Help" target="_blank">帮助</a></span></h3>
          </li>

          <li class="nav-item nav-account-user">
            <h3 class="title"><span class="label"><span class="label-prefix sr">当前登录用户：</span><span class="account-username" title="staff">staff</span></span> <i class="icon-caret-down ui-toggle-dd"></i></h3>

            <div class="wrapper wrapper-nav-sub">
              <div class="nav-sub">
                <ul>
                  <li class="nav-item nav-account-dashboard">
                    <a href="/">我的课程</a>
                  </li>
                  <li class="nav-item nav-account-signout">
                    <a class="action action-signout" href="/logout">退出</a>
                  </li>
                </ul>
              </div>
            </div>
          </li>
        </ol>
      </nav>

    </div>
  </header>
</div>


      <div id="page-alert"></div>

      <div id="content">
      
<div class="wrapper-mast wrapper">
    <header class="mast has-actions has-subtitle">
        <h1 class="page-header">
            <small class="subtitle">内容</small>
            <span class="sr">&gt; </span>课程大纲
        </h1>

        <nav class="nav-actions">
            <h3 class="sr">页面操作</h3>
            <ul>
                <li class="nav-item">
                    <a href="#" class="button button-new" data-category="chapter" data-parent="i4x://edX/Open_DemoX/course/edx_demo_course" data-default-name="Section" title="Click to add a new section">
                        <i class="icon-plus"></i>添加新章节
                    </a>
                </li>
                <li class="nav-item">
                    <a href="#" class="button button-toggle button-toggle-expand-collapse collapse-all is-hidden">
                        <span class="collapse-all"><i class="icon-arrow-up"></i> <span class="label">折叠所有章节</span></span>
                        <span class="expand-all"><i class="icon-arrow-down"></i> <span class="label">Expand All Sections</span></span>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="//localhost:8000/courses/edX/Open_DemoX/edx_demo_course/jump_to/i4x://edX/Open_DemoX/course/edx_demo_course" rel="external" class="button view-button view-live-button"
                       title="Click to open the courseware in the LMS in a new tab">在线查看</a>
                </li>
            </ul>
        </nav>
    </header>
</div>

<div class="wrapper-content wrapper">
				<section class="content">
					<article role="main" class="content-primary">
						<div class="wrapper-dnd">
							<article data-course-key="edX/Open_DemoX/edx_demo_course"
								data-locator="i4x://edX/Open_DemoX/course/edx_demo_course"
								class="outline outline-course">
								<div class="outline-content course-content">
									<ol class="list-sections is-sortable">
										<li class="ui-splint ui-splint-indicator"><span
											class="draggable-drop-indicator draggable-drop-indicator-initial"><i
												class="icon-caret-right"></i>
										</span></li>
										<li
											data-locator="i4x://edX/Open_DemoX/chapter/aec6f2fbbdf8472eb51f16d8340abc9b"
											data-parent="i4x://edX/Open_DemoX/course/edx_demo_course"
											class="outline-item outline-section has-warnings is-draggable is-collapsible ">

											<span
											class="draggable-drop-indicator draggable-drop-indicator-before"><i
												class="icon-caret-right"></i>
										</span>

											<div class="section-header">

												<h3 title="Collapse/Expand this section"
													class="section-header-details expand-collapse collapse ui-toggle-expansion">
													<i class="icon-caret-down icon"></i> 
													<span data-field-display-name="Display Name" data-field="display_name" class="wrapper-section-title wrapper-xblock-field incontext-editor is-editable">
														<span class="section-title item-title xblock-field-value incontext-editor-value">介绍</span>
														<div class="incontext-editor-action-wrapper">
															<a title="Edit the name" class="action-edit action-inline xblock-field-value-edit incontext-editor-open-action" href=""> 
															 <i class="icon-pencil"></i>
															 	<span class="sr">Edit</span> 
															 	</a>
														</div>
														<div class="xblock-string-field-editor incontext-editor-form">
															<form>
																<label>
																	<span class="sr">Edit Display Name (required)</span> 
																		<input type="text" title="Edit the name" data-metadata-name="display_name" class="xblock-field-input incontext-editor-input" value="介绍"> 
																</label>
																<button type="submit" name="submit" class="sr action action-primary">Save</button>
																<button type="button" name="cancel" class="sr action action-secondary">取消</button>
															</form>
														</div> 
													</span>
												</h3>

												<div class="section-header-actions">
													<ul class="actions-list">
														<li class="action-item action-configure">
															<a class="configure-button action-button" data-tooltip="Configure" href="#"> 
																<i class="icon-gear"></i> 
																<span class="sr action-button-text">Configure</span> 
															</a>
														</li>
														<li class="action-item action-delete">
															<a class="delete-button action-button" data-tooltip="Delete" href="#"> 
																<i class="icon icon-trash"></i> 
																<span class="sr action-button-text">Delete</span> 
															</a>
														</li>
														<li class="action-item action-drag">
															<span class="drag-handle section-drag-handle action" data-tooltip="Drag to reorder"> 
																<span class="sr">Drag to reorder</span> 
															</span>
														</li>
													</ul>
												</div>
											</div>
											<div class="section-status">

												<div class="status-release">
													<p>
														<span class="sr status-release-label">Release
															Status:</span> <span class="status-release-value"> <i
															class="icon icon-check-sign"></i> Released: 1970年01月01日
															05:00 UTC </span>
													</p>
												</div>
											</div>
											<div class="outline-content section-content">
												<ol class="list-subsections is-sortable">
													<li class="ui-splint ui-splint-indicator"><span
														class="draggable-drop-indicator draggable-drop-indicator-initial"><i
															class="icon-caret-right"></i>
													</span></li>
													<li
														data-locator="i4x://edX/Open_DemoX/sequential/bbffaf6118f54f038afa0a7256bf435e"
														data-parent="i4x://edX/Open_DemoX/chapter/aec6f2fbbdf8472eb51f16d8340abc9b"
														class="outline-item outline-subsection has-warnings is-draggable is-collapsible is-collapsed">

														<span
														class="draggable-drop-indicator draggable-drop-indicator-before"><i
															class="icon-caret-right"></i>
													</span>

														<div class="subsection-header">

															<h3 title="Collapse/Expand this subsection"
																class="subsection-header-details expand-collapse expand ui-toggle-expansion">
																<i class="icon-caret-down icon"></i> <span
																	data-field-display-name="Display Name"
																	data-field="display_name"
																	class="wrapper-subsection-title wrapper-xblock-field incontext-editor is-editable">
																	<span
																	class="subsection-title item-title xblock-field-value incontext-editor-value">Subsection</span>

																	<div class="incontext-editor-action-wrapper">
																		<a title="Edit the name"
																			class="action-edit action-inline xblock-field-value-edit incontext-editor-open-action"
																			href=""> <i class="icon-pencil"></i><span
																			class="sr"> Edit</span> </a>
																	</div>

																	<div class="xblock-string-field-editor incontext-editor-form">
																		<form>
																			<label><span class="sr">Edit Display Name (required)</span> <input type="text"
																				title="Edit the name"
																				data-metadata-name="display_name"
																				class="xblock-field-input incontext-editor-input"
																				value="Subsection"> </label>
																			<button type="submit" name="submit"
																				class="sr action action-primary">Save</button>
																			<button type="button" name="cancel"
																				class="sr action action-secondary">取消</button>
																		</form>
																	</div> </span>

															</h3>

															<div class="subsection-header-actions">
																<ul class="actions-list">

																	<li class="action-item action-configure"><a
																		class="configure-button action-button"
																		data-tooltip="Configure" href="#"> <i
																			class="icon-gear"></i> <span
																			class="sr action-button-text">Configure</span> </a></li>

																	<li class="action-item action-delete"><a
																		class="delete-button action-button"
																		data-tooltip="Delete" href="#"> <i
																			class="icon icon-trash"></i> <span
																			class="sr action-button-text">Delete</span> </a></li>
																	<li class="action-item action-drag"><span
																		class="drag-handle subsection-drag-handle action"
																		data-tooltip="Drag to reorder"> <span
																			class="sr">Drag to reorder</span> </span></li>
																</ul>
															</div>
														</div>
														<div class="subsection-status">

															<div class="status-release">
																<p>
																	<span class="sr status-release-label">Release
																		Status:</span> <span class="status-release-value"> <i
																		class="icon icon-check-sign"></i> Released:


																		1970年01月01日 05:00 UTC </span>
																</p>
															</div>

														</div>

														<div class="outline-content subsection-content">
															<ol class="list-units is-sortable">
																<li class="ui-splint ui-splint-indicator"><span
																	class="draggable-drop-indicator draggable-drop-indicator-initial"><i
																		class="icon-caret-right"></i>
																</span></li>
															</ol>


															<div class="add-unit add-item">
																<a title="Click to add a new 单元" data-default-name="单元"
																	data-parent="i4x://edX/Open_DemoX/sequential/bbffaf6118f54f038afa0a7256bf435e"
																	data-category="vertical" class="button button-new"
																	href="#"> <i class="icon icon-plus"></i>New 单元 </a>
															</div>

														</div> <span
														class="draggable-drop-indicator draggable-drop-indicator-after"><i
															class="icon-caret-right"></i>
													</span></li>
												</ol>
												<div class="add-subsection add-item">
													<a title="Click to add a new Subsection"
														data-default-name="Subsection"
														data-parent="i4x://edX/Open_DemoX/chapter/aec6f2fbbdf8472eb51f16d8340abc9b"
														data-category="sequential" class="button button-new"
														href="#"> <i class="icon icon-plus"></i>New Subsection</a>
												</div>

											</div> 
												<span class="draggable-drop-indicator draggable-drop-indicator-after"><i class="icon-caret-right"></i>
										       </span>
										       </li>
									</ol>


									<div class="add-section add-item">
										<a title="Click to add a new Section"
											data-default-name="Section"
											data-parent="i4x://edX/Open_DemoX/course/edx_demo_course"
											data-category="chapter" class="button button-new" href="#">
											<i class="icon icon-plus"></i>New Section </a>
									</div>

								</div>
						</article>
						</div>
						<div class="ui-loading is-hidden">
							<p>
								<span class="spin"><i class="icon-refresh"></i>
								</span> <span class="copy">载入中...</span>
							</p>
						</div>
					</article>
					<aside role="complimentary" class="content-supplementary">
						<div class="bit">
							<h3 class="title-3">我在这个页面能做什么？</h3>
							<p>您可以创建新章节和小节，设置章节发布日期，在小节中创建新单元。您可以设置小节中的作业类型以供计分，也可以打开小节作进一步编辑。</p>
							<p>此外，您可以拖动章节，小节和单元来重新组织您的课程。</p>
						</div>
					</aside>
				</section>
			</div>
      </div>

<div class="wrapper-sock wrapper">
  <ul class="list-actions list-cta">
    <li class="action-item">
      <a href="#sock" class="cta cta-show-sock"><i class="icon-question-sign"></i> <span class="copy">Looking for help with Studio?</span></a>
    </li>
  </ul>

  <div class="wrapper-inner wrapper">
    <section class="sock" id="sock">
      <header>
        <h2 class="title sr">edX Studio Documentation</h2>
      </header>

      <div class="support">
        <h3 class="title">edX Studio Documentation</h3>

        <div class="copy">
           <p>You can click Help in the upper right corner of any page to get more information about the page you're on. You can also use the links below to download the Building and Running an edX Course PDF file, to go to the edX Author Support site, or to enroll in edX101.</p>
        </div>

      <ul class="list-actions">
          <li class="action-item js-help-pdf">
            <a href="https://media.readthedocs.org/pdf/edx-partner-course-staff/latest/edx-partner-course-staff.pdf" target="_blank" rel="external" class="action action-primary">Building and Running an edX Course PDF</a>
          </li>

        <li class="action-item">
          <a href="http://help.edge.edx.org/" rel="external" class="action action-primary">edX Studio Author Support</a>
          <span class="tip">edX Studio Author Support</span>
        </li>
        <li class="action-item">
          <a href="https://edge.edx.org/courses/edX/edX101/How_to_Create_an_edX_Course/about" rel="external" class="action action-primary">注册edX101</a>
          <span class="tip">How to use edX Studio to build your course</span>
        </li>
      </ul>
      </div>

      <div class="feedback">
        <h3 class="title">Request help with edX Studio</h3>

        <div class="copy">
           <p>Have problems, questions, or suggestions about edX Studio?</p>
        </div>

        <ul class="list-actions">
          <li class="action-item">

            <a href="http://help.edge.edx.org/discussion/new" class="action action-primary show-tender" title="请使用工具Tender来分享您的反馈"><i class="icon-comments"></i>联系我们</a>
          </li>
        </ul>
      </div>
    </section>
  </div>
</div>


<div class="wrapper-footer wrapper">
  <footer class="primary" role="contentinfo">
    <div class="colophon">
      <p>&copy; 2014 <a href="http://www.edx.org" rel="external">edX</a>. 保留所有权利。</p>
    </div>

    <nav class="nav-peripheral">
      <ol>
        <li class="nav-item nav-peripheral-tos">
          <a data-rel="edx.org" href="#">服务条款</a>
        </li>
        <li class="nav-item nav-peripheral-pp">
          <a data-rel="edx.org" href="#">隐私政策</a>
        </li>
        <li class="nav-item nav-peripheral-feedback">
          <a href="http://help.edge.edx.org/discussion/new" class="show-tender" title="请使用工具Tender来分享您的反馈">联系我们</a>
        </li>
      </ol>
    </nav>
  </footer>
</div>
</body>
</html>
