<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
@charset "UTF-8"; 

[ng\:cloak], [ng-cloak], [data-ng-cloak], [x-ng-cloak], .ng-cloak,
	.x-ng-cloak, .ng-hide:not (.ng-hide-animate ){
	display: none !important;
}

ng\:form {
	display: block;
}
</style>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title ng-bind-template="Neo4j " class="ng-binding">Neo4j</title>
<meta name="description" content="Neo4j Browser">
<meta name="author" content="Neo Technology">
<link rel="apple-touch-icon" sizes="57x57"
    href="images/device-icons/apple-touch-icon-57x57.png">
<link rel="apple-touch-icon" sizes="60x60"
    href="images/device-icons/apple-touch-icon-60x60.png">
<link rel="apple-touch-icon" sizes="72x72"
    href="images/device-icons/apple-touch-icon-72x72.png">
<link rel="apple-touch-icon" sizes="76x76"
    href="images/device-icons/apple-touch-icon-76x76.png">
<link rel="apple-touch-icon" sizes="114x114"
    href="images/device-icons/apple-touch-icon-114x114.png">
<link rel="apple-touch-icon" sizes="120x120"
    href="images/device-icons/apple-touch-icon-120x120.png">
<link rel="apple-touch-icon" sizes="144x144"
    href="images/device-icons/apple-touch-icon-144x144.png">
<link rel="apple-touch-icon" sizes="152x152"
    href="images/device-icons/apple-touch-icon-152x152.png">
<link rel="apple-touch-icon" sizes="180x180"
    href="images/device-icons/apple-touch-icon-180x180.png">
<link rel="icon" type="image/png"
    href="images/device-icons/favicon-32x32.png" sizes="32x32">
<link rel="icon" type="image/png"
    href="images/device-icons/android-chrome-192x192.png"
    sizes="192x192">
<link rel="icon" type="image/png"
    href="images/device-icons/favicon-96x96.png" sizes="96x96">
<link rel="icon" type="image/png"
    href="images/device-icons/favicon-16x16.png" sizes="16x16">
<link rel="manifest" href="images/device-icons/manifest.json">
<link rel="shortcut icon" href="images/device-icons/favicon.ico">
<meta name="msapplication-TileColor" content="#2d89ef">
<meta name="msapplication-TileImage"
    content="images/device-icons/mstile-144x144.png">
<meta name="msapplication-config"
    content="images/device-icons/browserconfig.xml">
<meta name="theme-color" content="#ffffff">
<link rel="stylesheet" href="../styles/neo4j.css">
<style type="text/css"></style>
</head>
<body
    ng-class="{'connection-error': offline, 'show-drawer': isDrawerShown, 'modal-shown': isPopupShown}"
    ng-controller="LayoutCtrl" keyup="globalKey($event)"
    mousemove="globalMouse($event)" class="theme-normal">
    <!--[if lt IE 9]>
    <div id="incompatible">Sorry, you need to upgrade to the latest version of Internet Explorer<br>in order to use the Neo4j browser</div><![endif]-->
    <div id="page-container" class="">
        <div id="leftbar" ng-controller="SidebarCtrl" class="ng-scope">
            <div id="nav">
                <ul class="nav list-group">
                    <li
                        ng-class="{active: showingDrawer(&quot;database&quot;) }"
                        class="nav-header">
                        <div
                            ng-click="toggleDrawer(&quot;database&quot;)"
                            tooltip="Overview"
                            tooltip-placement="bottom" class="cover"></div>
                        <a>Neo4j
                            <div fancy-logo=""
                                ng-class="{loading: currentFrame.isLoading}"
                                class="logo">
                                <span class="ball one"></span><span
                                    class="ball two"></span><span
                                    class="ball three"></span>
                            </div>
                    </a>
                    </li>
                    <li
                        ng-class="{active: showingDrawer(&quot;scripts&quot;) }"
                        tooltip="Favorites" tooltip-placement="bottom"><a
                        ng-click="toggleDrawer(&quot;scripts&quot;)"
                        class="fa fa-star"></a></li>
                    <li
                        ng-class="{active: showingDrawer(&quot;info&quot;) }"
                        tooltip="Information" tooltip-placement="bottom"><a
                        ng-click="toggleDrawer(&quot;info&quot;)"
                        class="fa fa-info-circle"></a></li>
                </ul>
                <ul class="nav list-group bottom">
                    <li
                        ng-class="{active: showingDrawer(&quot;preferences&quot;) }"
                        tooltip="Configuration" tooltip-placement="top"><a
                        ng-click="toggleDrawer(&quot;preferences&quot;)"
                        class="fa fa-cog"></a></li>
                    <li
                        ng-class="{active: showingDrawer(&quot;credits&quot;) }"
                        tooltip="About" tooltip-placement="top"><a
                        ng-click="toggleDrawer(&quot;credits&quot;)">@</a></li>
                </ul>
            </div>
            <div id="drawer" ng-switch="" on="whichDrawer">
                <!-- ngSwitchWhen: database -->
                <!-- ngSwitchWhen: scripts -->
                <!-- ngSwitchWhen: info -->
                <!-- ngSwitchWhen: preferences -->
                <!-- ngSwitchWhen: credits -->
            </div>
        </div>
        <div id="main">
            <div id="editor" ng-controller="EditorCtrl"
                ng-mousedown="focusEditor($event)"
                ng-class="{'file-loaded': settings.filemode &amp;&amp; editor.document.id, 'maximize-editor': editor.maximized}"
                class="ng-scope">
                <!-- ngIf: settings.filemode && editor.document.id -->
                <div class="view-editor">
                    <span
                        ng-class="{'one-line': editorOneLine, 'disable-highlighting': disableHighlighting}"
                        class="one-line">
                        <div class="prompt code-style">$</div> <ui-codemirror
                            ui-codemirror-opts="{gutters:['cypher-hints'], theme: 'neo', mode: 'cypher', autofocus: true, lineNumbers: true, lineWrapping: true, onLoad: codemirrorLoaded}"
                            ng-model="editor.content"
                            placeholder="Use <shift-return> for multi-line, <cmd-return> to evaluate command"
                            class="ng-pristine ng-untouched ng-valid">
                        <div class="CodeMirror cm-s-neo CodeMirror-wrap">
                            <div
                                style="overflow: hidden; position: relative; width: 3px; height: 0px; top: 0px; left: 43px;">
                                <textarea autocorrect="off"
                                    autocapitalize="off"
                                    spellcheck="false"
                                    style="position: absolute; padding: 0px; width: 1000px; height: 1em; outline: none;"
                                    tabindex="0"></textarea>
                            </div>
                            <div class="CodeMirror-vscrollbar"
                                not-content="true">
                                <div
                                    style="min-width: 1px; height: 0px;"></div>
                            </div>
                            <div class="CodeMirror-hscrollbar"
                                not-content="true">
                                <div
                                    style="height: 100%; min-height: 1px; width: 0px;"></div>
                            </div>
                            <div class="CodeMirror-scrollbar-filler"
                                not-content="true"></div>
                            <div class="CodeMirror-gutter-filler"
                                not-content="true"></div>
                            <div class="CodeMirror-scroll" tabindex="-1">
                                <div class="CodeMirror-sizer"
                                    style="margin-left: 43px; margin-bottom: -17px; border-right-width: 13px; min-height: 23px; padding-right: 0px; padding-bottom: 0px;">
                                    <div
                                        style="position: relative; top: 0px;">
                                        <div class="CodeMirror-lines">
                                            <div
                                                style="position: relative; outline: none;">
                                                <div
                                                    class="CodeMirror-measure">
                                                    <span><span>​</span>x</span>
                                                </div>
                                                <div
                                                    class="CodeMirror-measure"></div>
                                                <div
                                                    style="position: relative; z-index: 1;"></div>
                                                <div
                                                    class="CodeMirror-cursors">
                                                    <div
                                                        class="CodeMirror-cursor"
                                                        style="left: 0px; top: 0px; height: 23px;">&nbsp;</div>
                                                </div>
                                                <div
                                                    class="CodeMirror-code">
                                                    <div
                                                        style="position: relative;">
                                                        <div
                                                            class="CodeMirror-gutter-wrapper"
                                                            style="left: -43px; width: 43px;">
                                                            <div
                                                                class="CodeMirror-linenumber CodeMirror-gutter-elt"
                                                                style="left: 13px; width: 20px;">1</div>
                                                        </div>
                                                        <pre class="">
                                                            <span
                                                                style="padding-right: 0.1px;"><span>​</span></span>
                                                        </pre>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div
                                    style="position: absolute; height: 13px; width: 1px; top: 23px;"></div>
                                <div class="CodeMirror-gutters"
                                    style="height: 36px;">
                                    <div
                                        class="CodeMirror-gutter cypher-hints"></div>
                                    <div
                                        class="CodeMirror-gutter CodeMirror-linenumbers"
                                        style="width: 20px;"></div>
                                </div>
                            </div>
                        </div>
                        </ui-codemirror>
                    </span>
                    <!-- ngIf: !(settings.filemode && editor.document.id) -->
                    <ul
                        ng-if="!(settings.filemode &amp;&amp; editor.document.id)"
                        class="controls list-inline ng-scope">
                        <li><a
                            ng-class="{active: editorHasContent, 'enabled': editor.document.id, 'changed': editor.hasChanged()}"
                            ng-click="star()" tooltip="Favorite"
                            tooltip-placement="left"
                            class="balled golden"><i
                                ng-class="{'fa-exclamation': editor.hasChanged()}"
                                class="fa fa-star"></i></a></li>
                        <!-- ngIf: !settings.filemode -->
                        <li ng-if="!settings.filemode" class="ng-scope"><a
                            ng-click="editor.setContent(&quot;&quot;)"
                            ng-class="{active: editorHasContent}"
                            tooltip="Clear" tooltip-placement="left"
                            class="balled add"><i class="fa fa-plus"></i></a></li>
                        <!-- end ngIf: !settings.filemode -->
                        <li><a
                            ng-click="editor.execScript(editor.content)"
                            ng-class="{active: editorHasContent}"
                            tooltip="Play" tooltip-placement="left"
                            class="balled success"><i
                                class="fa fa-play"></i></a></li>
                    </ul>
                    <!-- end ngIf: !(settings.filemode && editor.document.id) -->
                    <!-- ngIf: editor.showMessage -->
                    <!-- ngIf: unauthorized -->
                </div>
            </div>
            <div frame-stream="">
                <div>
                    <div
                        ng-show="neo4j.version &amp;&amp; frames.items.length == 0"
                        class="intro ng-hide">
                        <footer class="ng-binding">In the
                        beginning was the command line.<br>
                        — Neal Stephenson</footer>
                    </div>
                    <div id="stream" style="top: 73px;">
                        <!-- ngRepeat: frame in frames.items | orderBy:["-pinTime", "-startTime"] -->
                        <div
                            ng-repeat="frame in frames.items | orderBy:[&quot;-pinTime&quot;, &quot;-startTime&quot;]"
                            class="frame frame-in ng-scope"
                            style="position: relative; top: 0px; opacity: 1; max-height: 10000px;">
                            <!-- ngInclude: frame.templateUrl -->
                            <div ng-include="frame.templateUrl"
                                ng-controller="FrameCtrl"
                                scroll-to-top="stream" class="ng-scope">
                                <div fullscreen="fullscreen"
                                    class="ng-scope">
                                    <div class="outer">
                                        <div class="code-bar">
                                            <ul
                                                class="actions list-inline">
                                                <li dropdown=""
                                                    ng-show="frame.type == &quot;http&quot;"
                                                    class="dropdown ng-hide"><a
                                                    dropdown-toggle=""
                                                    class="button fa fa-download dropdown-toggle"
                                                    aria-haspopup="true"
                                                    aria-expanded="false"></a>
                                                    <ul
                                                        class="dropdown-menu">
                                                        <li><a
                                                            exportable=""
                                                            ng-click="exportJSON(frame.response)">Download
                                                                JSON</a></li>
                                                    </ul></li>
                                                <li dropdown=""
                                                    ng-show="frame.type == &quot;shell&quot;"
                                                    class="dropdown ng-hide"><a
                                                    dropdown-toggle=""
                                                    class="button fa fa-download dropdown-toggle"
                                                    aria-haspopup="true"
                                                    aria-expanded="false"></a>
                                                    <ul
                                                        class="dropdown-menu">
                                                        <li><a
                                                            exportable=""
                                                            ng-click="exportText(frame.response)">Download
                                                                TXT</a></li>
                                                    </ul></li>
                                                <li dropdown=""
                                                    ng-show="frame.type == &quot;cypher&quot;"
                                                    class="dropdown ng-hide"><a
                                                    dropdown-toggle=""
                                                    tooltip-placement="bottom"
                                                    tooltip="Export to file"
                                                    class="button fa fa-download dropdown-toggle"
                                                    aria-haspopup="true"
                                                    aria-expanded="false"></a>
                                                    <ul
                                                        class="dropdown-menu">
                                                        <li><a
                                                            exportable=""
                                                            ng-click="exportGraphSVG()"
                                                            ng-show="isActive(&quot;graph&quot;)"
                                                            class="ng-hide">Export
                                                                SVG</a><a
                                                            exportable=""
                                                            ng-click="exportPlanSVG()"
                                                            ng-show="isActive(&quot;plan&quot;)"
                                                            class="ng-hide">Export
                                                                SVG</a><a
                                                            exportable=""
                                                            ng-click="exportGraphPNG()"
                                                            ng-show="isActive(&quot;graph&quot;)"
                                                            class="ng-hide">Export
                                                                PNG</a><a
                                                            exportable=""
                                                            ng-click="exportPlanPNG()"
                                                            ng-show="isActive(&quot;plan&quot;)"
                                                            class="ng-hide">Export
                                                                PNG</a><a
                                                            exportable=""
                                                            ng-click="exportJSON(frame.response.table._response)">Export
                                                                JSON</a><a
                                                            exportable=""
                                                            ng-click="exportCSV(frame.response.table)">Export
                                                                CSV</a></li>
                                                    </ul></li>
                                                <li><a
                                                    ng-click="pin(frame)"
                                                    ng-class="{selected: pinned}"
                                                    tooltip-placement="bottom"
                                                    tooltip="Pin at top"
                                                    class="button fa fa-thumb-tack"></a></li>
                                                <li><a
                                                    ng-click="toggleFullscreen(true)"
                                                    tooltip-placement="bottom"
                                                    tooltip="Fullscreen"
                                                    ng-show="frame.fullscreenable"
                                                    class="button fa fa-expand"></a></li>
                                                <li><a
                                                    ng-click="frames.close(frame)"
                                                    tooltip-placement="bottom"
                                                    tooltip="Cancel and close"
                                                    class="button fa fa-times-circle"></a></li>
                                            </ul>
                                            <div class="status">
                                                <!-- ngIf: frame.type == "cypher" -->
                                                <span
                                                    click-to-code="frame.input"
                                                    class="code mono ng-binding">:play
                                                    concepts</span>
                                            </div>
                                            <a
                                                ng-click="toggleFullscreen(false)"
                                                tooltip="Close Fullscreen"
                                                tooltip-placement="bottom"
                                                class="close-fullscreen fa fa-compress"></a>
                                        </div>
                                        <div class="inner">
                                            <div
                                                ng-hide="frame.hasErrors"
                                                class="view-result help">
                                                <div play-src="play-src"
                                                    class="play">
                                                    <article
                                                        class="guide ng-scope">
                                                    <div
                                                        ng-mouseenter="pause()"
                                                        ng-mouseleave="play()"
                                                        no-ng-animate=""
                                                        class="deck container-fluid carousel ng-isolate-scope">
                                                        <div
                                                            class="carousel-indicators-wrapper">
                                                            <ol
                                                                ng-show="slides.length > 1"
                                                                class="carousel-indicators">
                                                                <!-- ngRepeat: slide in slides track by $index -->
                                                                <li
                                                                    ng-repeat="slide in slides track by $index"
                                                                    ng-class="{active: isActive(slide)}"
                                                                    ng-click="select(slide)"
                                                                    class="ng-scope active"></li>
                                                                <!-- end ngRepeat: slide in slides track by $index -->
                                                                <li
                                                                    ng-repeat="slide in slides track by $index"
                                                                    ng-class="{active: isActive(slide)}"
                                                                    ng-click="select(slide)"
                                                                    class="ng-scope"></li>
                                                                <!-- end ngRepeat: slide in slides track by $index -->
                                                                <li
                                                                    ng-repeat="slide in slides track by $index"
                                                                    ng-class="{active: isActive(slide)}"
                                                                    ng-click="select(slide)"
                                                                    class="ng-scope"></li>
                                                                <!-- end ngRepeat: slide in slides track by $index -->
                                                                <li
                                                                    ng-repeat="slide in slides track by $index"
                                                                    ng-class="{active: isActive(slide)}"
                                                                    ng-click="select(slide)"
                                                                    class="ng-scope"></li>
                                                                <!-- end ngRepeat: slide in slides track by $index -->
                                                                <li
                                                                    ng-repeat="slide in slides track by $index"
                                                                    ng-class="{active: isActive(slide)}"
                                                                    ng-click="select(slide)"
                                                                    class="ng-scope"></li>
                                                                <!-- end ngRepeat: slide in slides track by $index -->
                                                                <li
                                                                    ng-repeat="slide in slides track by $index"
                                                                    ng-class="{active: isActive(slide)}"
                                                                    ng-click="select(slide)"
                                                                    class="ng-scope"></li>
                                                                <!-- end ngRepeat: slide in slides track by $index -->
                                                                <li
                                                                    ng-repeat="slide in slides track by $index"
                                                                    ng-class="{active: isActive(slide)}"
                                                                    ng-click="select(slide)"
                                                                    class="ng-scope"></li>
                                                                <!-- end ngRepeat: slide in slides track by $index -->
                                                            </ol>
                                                        </div>
                                                        <div
                                                            ng-transclude=""
                                                            class="carousel-inner">
                                                            <div
                                                                ng-class="{ 'active': leaving || (active &amp;&amp; !entering), 'prev': (next || active) &amp;&amp; direction=='prev', 'next': (next || active) &amp;&amp; direction=='next', 'right': direction=='prev',  'left': direction=='next'  }"
                                                                ng-transclude=""
                                                                class="row-fluid item ng-isolate-scope active">
                                                                <div
                                                                    class="col-sm-3 ng-scope">
                                                                    <h3>Graph
                                                                        Fundamentals</h3>
                                                                    <p
                                                                        class="lead">Basic
                                                                        concepts
                                                                        to
                                                                        get
                                                                        you
                                                                        going.</p>
                                                                </div>
                                                                <div
                                                                    class="col-sm-9 ng-scope">
                                                                    <p>A
                                                                        graph
                                                                        database
                                                                        can
                                                                        store
                                                                        any
                                                                        kind
                                                                        of
                                                                        data
                                                                        using
                                                                        a
                                                                        few
                                                                        simple
                                                                        concepts:</p>
                                                                    <ol
                                                                        class="big">
                                                                        <li>Nodes
                                                                            -
                                                                            graph
                                                                            data
                                                                            records</li>
                                                                        <li>Relationships
                                                                            -
                                                                            connect
                                                                            nodes</li>
                                                                        <li>Properties
                                                                            -
                                                                            named
                                                                            data
                                                                            values</li>
                                                                    </ol>
                                                                </div>
                                                            </div>
                                                            <div
                                                                ng-class="{ 'active': leaving || (active &amp;&amp; !entering), 'prev': (next || active) &amp;&amp; direction=='prev', 'next': (next || active) &amp;&amp; direction=='next', 'right': direction=='prev',  'left': direction=='next'  }"
                                                                ng-transclude=""
                                                                class="row-fluid item ng-isolate-scope">
                                                                <div
                                                                    class="col-sm-3 ng-scope">
                                                                    <h3>
                                                                        A&nbsp;<em>Graph</em>
                                                                        Database
                                                                    </h3>
                                                                    <p
                                                                        class="lead">Neo4j
                                                                        stores
                                                                        data
                                                                        in
                                                                        a
                                                                        Graph,
                                                                        with
                                                                        records
                                                                        called
                                                                        Nodes.</p>
                                                                </div>
                                                                <div
                                                                    class="col-sm-5 ng-scope">
                                                                    <p>
                                                                        The
                                                                        simplest
                                                                        graph
                                                                        has
                                                                        just
                                                                        a
                                                                        single
                                                                        node
                                                                        with
                                                                        some
                                                                        named
                                                                        values
                                                                        called
                                                                        Properties.
                                                                        Let's
                                                                        draw
                                                                        a
                                                                        social
                                                                        graph
                                                                        of
                                                                        our
                                                                        friends
                                                                        on
                                                                        the
                                                                        Neo4j
                                                                        team:
                                                                    </p>
                                                                    <ol>
                                                                        <li>Start
                                                                            by
                                                                            drawing
                                                                            a
                                                                            circle
                                                                            for
                                                                            the
                                                                            node</li>
                                                                        <li>Add
                                                                            the
                                                                            name
                                                                            Emil</li>
                                                                        <li>Note
                                                                            that
                                                                            he
                                                                            is
                                                                            from
                                                                            Sweden</li>
                                                                    </ol>
                                                                    <ul>
                                                                        <li>Nodes
                                                                            are
                                                                            the
                                                                            name
                                                                            for
                                                                            data
                                                                            records
                                                                            in
                                                                            a
                                                                            graph</li>
                                                                        <li>Data
                                                                            is
                                                                            stored
                                                                            as
                                                                            Properties</li>
                                                                        <li>Properties
                                                                            are
                                                                            simple
                                                                            name/value
                                                                            pairs</li>
                                                                    </ul>
                                                                </div>
                                                                <div
                                                                    class="col-sm-4 ng-scope">
                                                                    <img
                                                                        src="../images/one_node.png"
                                                                        class="img-responsive">
                                                                </div>
                                                            </div>
                                                            <div
                                                                ng-class="{ 'active': leaving || (active &amp;&amp; !entering), 'prev': (next || active) &amp;&amp; direction=='prev', 'next': (next || active) &amp;&amp; direction=='next', 'right': direction=='prev',  'left': direction=='next'  }"
                                                                ng-transclude=""
                                                                class="row-fluid item ng-isolate-scope">
                                                                <div
                                                                    class="col-sm-3 ng-scope">
                                                                    <h3>Labels</h3>
                                                                    <p
                                                                        class="lead">Associate
                                                                        a
                                                                        set
                                                                        of
                                                                        nodes.</p>
                                                                </div>
                                                                <div
                                                                    class="col-sm-5 ng-scope">
                                                                    <p>
                                                                        Nodes
                                                                        can
                                                                        be
                                                                        grouped
                                                                        together
                                                                        by
                                                                        applying
                                                                        a
                                                                        Label
                                                                        to
                                                                        each
                                                                        member.
                                                                        In
                                                                        our
                                                                        social
                                                                        graph,
                                                                        we'll
                                                                        label
                                                                        each
                                                                        node
                                                                        that
                                                                        represents
                                                                        a
                                                                        Person.
                                                                    </p>
                                                                    <ol>
                                                                        <li>Apply
                                                                            the
                                                                            label
                                                                            "Person"
                                                                            to
                                                                            the
                                                                            node
                                                                            we
                                                                            created
                                                                            for
                                                                            Emil</li>
                                                                        <li>Color
                                                                            "Person"
                                                                            nodes
                                                                            red</li>
                                                                    </ol>
                                                                    <ul>
                                                                        <li>A
                                                                            node
                                                                            can
                                                                            have
                                                                            zero
                                                                            or
                                                                            more
                                                                            labels</li>
                                                                        <li>Labels
                                                                            do
                                                                            not
                                                                            have
                                                                            any
                                                                            properties</li>
                                                                    </ul>
                                                                </div>
                                                                <div
                                                                    class="col-sm-4 ng-scope">
                                                                    <img
                                                                        src="../images/labeled_node.png"
                                                                        class="img-responsive">
                                                                </div>
                                                            </div>
                                                            <div
                                                                ng-class="{ 'active': leaving || (active &amp;&amp; !entering), 'prev': (next || active) &amp;&amp; direction=='prev', 'next': (next || active) &amp;&amp; direction=='next', 'right': direction=='prev',  'left': direction=='next'  }"
                                                                ng-transclude=""
                                                                class="row-fluid item ng-isolate-scope">
                                                                <div
                                                                    class="col-sm-3 ng-scope">
                                                                    <h3>More
                                                                        Nodes</h3>
                                                                    <p
                                                                        class="lead">Schema-free,
                                                                        nodes
                                                                        can
                                                                        have
                                                                        a
                                                                        mix
                                                                        of
                                                                        common
                                                                        and
                                                                        unique
                                                                        properties.</p>
                                                                </div>
                                                                <div
                                                                    class="col-sm-5 ng-scope">
                                                                    <p>
                                                                        Like
                                                                        any
                                                                        database,
                                                                        storing
                                                                        data
                                                                        in
                                                                        Neo4j
                                                                        can
                                                                        be
                                                                        as
                                                                        simple
                                                                        as
                                                                        adding
                                                                        more
                                                                        records.
                                                                        We'll
                                                                        add
                                                                        a
                                                                        few
                                                                        more
                                                                        nodes:
                                                                    </p>
                                                                    <ol>
                                                                        <li>Emil
                                                                            has
                                                                            a
                                                                            klout
                                                                            score
                                                                            of
                                                                            99</li>
                                                                        <li>Johan,
                                                                            from
                                                                            Sweden,
                                                                            who
                                                                            is
                                                                            learning
                                                                            to
                                                                            surf</li>
                                                                        <li>Ian,
                                                                            from
                                                                            England,
                                                                            who
                                                                            is
                                                                            an
                                                                            author</li>
                                                                        <li>Rik,
                                                                            from
                                                                            Belgium,
                                                                            has
                                                                            a
                                                                            cat
                                                                            named
                                                                            Orval</li>
                                                                        <li>Allison,
                                                                            from
                                                                            California,
                                                                            who
                                                                            surfs</li>
                                                                    </ol>
                                                                    <ul>
                                                                        <li>Similar
                                                                            nodes
                                                                            can
                                                                            have
                                                                            different
                                                                            properties</li>
                                                                        <li>Properties
                                                                            can
                                                                            be
                                                                            strings,
                                                                            numbers,
                                                                            or
                                                                            booleans</li>
                                                                        <li>Neo4j
                                                                            can
                                                                            store
                                                                            billions
                                                                            of
                                                                            nodes</li>
                                                                    </ul>
                                                                </div>
                                                                <div
                                                                    class="col-sm-4 ng-scope">
                                                                    <img
                                                                        src="../images/more_nodes.png"
                                                                        class="img-responsive">
                                                                </div>
                                                            </div>
                                                            <div
                                                                ng-class="{ 'active': leaving || (active &amp;&amp; !entering), 'prev': (next || active) &amp;&amp; direction=='prev', 'next': (next || active) &amp;&amp; direction=='next', 'right': direction=='prev',  'left': direction=='next'  }"
                                                                ng-transclude=""
                                                                class="row-fluid item ng-isolate-scope">
                                                                <div
                                                                    class="col-sm-3 ng-scope">
                                                                    <h3>Consider
                                                                        Relationships</h3>
                                                                    <p
                                                                        class="lead">Connect
                                                                        nodes
                                                                        in
                                                                        the
                                                                        graph</p>
                                                                </div>
                                                                <div
                                                                    class="col-sm-5 ng-scope">
                                                                    <p
                                                                        class="summary">
                                                                        The
                                                                        real
                                                                        power
                                                                        of
                                                                        Neo4j
                                                                        is
                                                                        in
                                                                        connected
                                                                        data.
                                                                        To
                                                                        associate
                                                                        any
                                                                        two
                                                                        nodes,
                                                                        add
                                                                        a
                                                                        Relationship
                                                                        which
                                                                        describes
                                                                        how
                                                                        the
                                                                        records
                                                                        are
                                                                        related.
                                                                    </p>
                                                                    <p>In
                                                                        our
                                                                        social
                                                                        graph,
                                                                        we
                                                                        simply
                                                                        say
                                                                        who
                                                                        KNOWS
                                                                        whom:</p>
                                                                    <ol>
                                                                        <li>Emil
                                                                            KNOWS
                                                                            Johan
                                                                            and
                                                                            Ian</li>
                                                                        <li>Johan
                                                                            KNOWS
                                                                            Ian
                                                                            and
                                                                            Rik</li>
                                                                        <li>Rik
                                                                            and
                                                                            Ian
                                                                            KNOWS
                                                                            Allison</li>
                                                                    </ol>
                                                                    <ul>
                                                                        <li>Relationships
                                                                            always
                                                                            have
                                                                            direction</li>
                                                                        <li>Relationships
                                                                            always
                                                                            have
                                                                            a
                                                                            type</li>
                                                                        <li>Relationships
                                                                            form
                                                                            patterns
                                                                            of
                                                                            data</li>
                                                                    </ul>
                                                                </div>
                                                                <div
                                                                    class="col-sm-4 ng-scope">
                                                                    <img
                                                                        src="../images/relationships.png"
                                                                        class="img-responsive">
                                                                </div>
                                                            </div>
                                                            <div
                                                                ng-class="{ 'active': leaving || (active &amp;&amp; !entering), 'prev': (next || active) &amp;&amp; direction=='prev', 'next': (next || active) &amp;&amp; direction=='next', 'right': direction=='prev',  'left': direction=='next'  }"
                                                                ng-transclude=""
                                                                class="row-fluid item ng-isolate-scope">
                                                                <div
                                                                    class="col-sm-3 ng-scope">
                                                                    <h3>Relationship
                                                                        properties</h3>
                                                                    <p
                                                                        class="lead">Store
                                                                        information
                                                                        shared
                                                                        by
                                                                        two
                                                                        nodes.</p>
                                                                </div>
                                                                <div
                                                                    class="col-sm-5 ng-scope">
                                                                    <p
                                                                        class="summary">
                                                                        In
                                                                        a
                                                                        property
                                                                        graph,
                                                                        relationships
                                                                        are
                                                                        data
                                                                        records
                                                                        that
                                                                        can
                                                                        also
                                                                        contain
                                                                        properties.
                                                                        Looking
                                                                        more
                                                                        closely
                                                                        at
                                                                        Emil's
                                                                        relationships,
                                                                        note
                                                                        that:
                                                                    </p>
                                                                    <ul>
                                                                        <li>Emil
                                                                            has
                                                                            known
                                                                            Johan
                                                                            since
                                                                            2001</li>
                                                                        <li>Emil
                                                                            rates
                                                                            Ian
                                                                            5
                                                                            (out
                                                                            of
                                                                            5)</li>
                                                                        <li>Everyone
                                                                            else
                                                                            can
                                                                            have
                                                                            similar
                                                                            relationship
                                                                            properties</li>
                                                                    </ul>
                                                                </div>
                                                                <div
                                                                    class="col-sm-4 ng-scope">
                                                                    <img
                                                                        src="../images/rel-props.png"
                                                                        class="img-responsive">
                                                                </div>
                                                            </div>
                                                            <div
                                                                ng-class="{ 'active': leaving || (active &amp;&amp; !entering), 'prev': (next || active) &amp;&amp; direction=='prev', 'next': (next || active) &amp;&amp; direction=='next', 'right': direction=='prev',  'left': direction=='next'  }"
                                                                ng-transclude=""
                                                                class="row-fluid item ng-isolate-scope">
                                                                <div
                                                                    class="col-sm-4 ng-scope">
                                                                    <h3>Next
                                                                        steps</h3>
                                                                    <p>A
                                                                        property
                                                                        graph
                                                                        contains
                                                                        nodes
                                                                        and
                                                                        relationships,
                                                                        with
                                                                        properties
                                                                        on
                                                                        both.</p>
                                                                </div>
                                                                <div
                                                                    class="col-sm-4 ng-scope">
                                                                    <h3>Keep
                                                                        getting
                                                                        started</h3>
                                                                    <ul
                                                                        class="undecorated">
                                                                        <li><a
                                                                            play-topic="intro">Intro</a>
                                                                            -
                                                                            a
                                                                            guided
                                                                            tour</li>
                                                                        <li><a
                                                                            play-topic="cypher">Cypher</a>
                                                                            -
                                                                            query
                                                                            language</li>
                                                                        <li><a
                                                                            href="http://neo4j.com/docs/2.3.2/graphdb-concepts.html"
                                                                            target="_blank">Neo4j
                                                                                Manual</a>
                                                                            -
                                                                            section
                                                                            on
                                                                            graphdb
                                                                            concepts</li>
                                                                    </ul>
                                                                </div>
                                                                <div
                                                                    class="col-sm-4 ng-scope">
                                                                    <h3>Jump
                                                                        into
                                                                        code</h3>
                                                                    <ul
                                                                        class="undecorated">
                                                                        <li><a
                                                                            play-topic="movie-graph">The
                                                                                Movie
                                                                                Graph</a></li>
                                                                    </ul>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <a
                                                            ng-click="prev()"
                                                            ng-show="slides.length > 1 &amp;&amp; !slides[0].active"
                                                            class="carousel-control left ng-hide">‹</a><a
                                                            ng-click="next()"
                                                            ng-show="slides.length > 1 &amp;&amp; !slides[slides.length - 1].active"
                                                            class="carousel-control right">›</a>
                                                    </div>
                                                    </article>
                                                </div>
                                            </div>
                                            <div
                                                ng-show="frame.hasErrors"
                                                class="view-result-error help ng-hide">
                                                <pre>No such topic to play.</pre>
                                            </div>
                                            <div
                                                ng-class="{error: frame.hasErrors, loading: frame.isLoading}"
                                                ng-show="frame.errorText.length"
                                                class="status-bar ng-hide">
                                                <div
                                                    ng-hide="frame.isLoading"
                                                    class="status ng-binding">
                                                    <span
                                                        ng-show="frame.hasErrors"
                                                        class="ng-hide">
                                                        <div
                                                            class="fa fa-exclamation-triangle icon-warning-sign">&nbsp;</div>
                                                    </span>false
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- end ngRepeat: frame in frames.items | orderBy:["-pinTime", "-startTime"] -->
                        <div
                            ng-repeat="frame in frames.items | orderBy:[&quot;-pinTime&quot;, &quot;-startTime&quot;]"
                            class="frame frame-in ng-scope"
                            style="position: relative; top: 0px; opacity: 1; max-height: 10000px;">
                            <!-- ngInclude: frame.templateUrl -->
                            <div ng-include="frame.templateUrl"
                                ng-controller="FrameCtrl"
                                scroll-to-top="stream" class="ng-scope">
                                <div fullscreen="fullscreen"
                                    class="ng-scope">
                                    <div class="outer">
                                        <div class="code-bar">
                                            <ul
                                                class="actions list-inline">
                                                <li dropdown=""
                                                    ng-show="frame.type == &quot;http&quot;"
                                                    class="dropdown ng-hide"><a
                                                    dropdown-toggle=""
                                                    class="button fa fa-download dropdown-toggle"
                                                    aria-haspopup="true"
                                                    aria-expanded="false"></a>
                                                    <ul
                                                        class="dropdown-menu">
                                                        <li><a
                                                            exportable=""
                                                            ng-click="exportJSON(frame.response)">Download
                                                                JSON</a></li>
                                                    </ul></li>
                                                <li dropdown=""
                                                    ng-show="frame.type == &quot;shell&quot;"
                                                    class="dropdown ng-hide"><a
                                                    dropdown-toggle=""
                                                    class="button fa fa-download dropdown-toggle"
                                                    aria-haspopup="true"
                                                    aria-expanded="false"></a>
                                                    <ul
                                                        class="dropdown-menu">
                                                        <li><a
                                                            exportable=""
                                                            ng-click="exportText(frame.response)">Download
                                                                TXT</a></li>
                                                    </ul></li>
                                                <li dropdown=""
                                                    ng-show="frame.type == &quot;cypher&quot;"
                                                    class="dropdown ng-hide"><a
                                                    dropdown-toggle=""
                                                    tooltip-placement="bottom"
                                                    tooltip="Export to file"
                                                    class="button fa fa-download dropdown-toggle"
                                                    aria-haspopup="true"
                                                    aria-expanded="false"></a>
                                                    <ul
                                                        class="dropdown-menu">
                                                        <li><a
                                                            exportable=""
                                                            ng-click="exportGraphSVG()"
                                                            ng-show="isActive(&quot;graph&quot;)"
                                                            class="ng-hide">Export
                                                                SVG</a><a
                                                            exportable=""
                                                            ng-click="exportPlanSVG()"
                                                            ng-show="isActive(&quot;plan&quot;)"
                                                            class="ng-hide">Export
                                                                SVG</a><a
                                                            exportable=""
                                                            ng-click="exportGraphPNG()"
                                                            ng-show="isActive(&quot;graph&quot;)"
                                                            class="ng-hide">Export
                                                                PNG</a><a
                                                            exportable=""
                                                            ng-click="exportPlanPNG()"
                                                            ng-show="isActive(&quot;plan&quot;)"
                                                            class="ng-hide">Export
                                                                PNG</a><a
                                                            exportable=""
                                                            ng-click="exportJSON(frame.response.table._response)">Export
                                                                JSON</a><a
                                                            exportable=""
                                                            ng-click="exportCSV(frame.response.table)">Export
                                                                CSV</a></li>
                                                    </ul></li>
                                                <li><a
                                                    ng-click="pin(frame)"
                                                    ng-class="{selected: pinned}"
                                                    tooltip-placement="bottom"
                                                    tooltip="Pin at top"
                                                    class="button fa fa-thumb-tack"></a></li>
                                                <li><a
                                                    ng-click="toggleFullscreen(true)"
                                                    tooltip-placement="bottom"
                                                    tooltip="Fullscreen"
                                                    ng-show="frame.fullscreenable"
                                                    class="button fa fa-expand"></a></li>
                                                <li><a
                                                    ng-click="frames.close(frame)"
                                                    tooltip-placement="bottom"
                                                    tooltip="Cancel and close"
                                                    class="button fa fa-times-circle"></a></li>
                                            </ul>
                                            <div class="status">
                                                <!-- ngIf: frame.type == "cypher" -->
                                                <span
                                                    click-to-code="frame.input"
                                                    class="code mono ng-binding">:play
                                                    start</span>
                                            </div>
                                            <a
                                                ng-click="toggleFullscreen(false)"
                                                tooltip="Close Fullscreen"
                                                tooltip-placement="bottom"
                                                class="close-fullscreen fa fa-compress"></a>
                                        </div>
                                        <div class="inner">
                                            <div
                                                ng-hide="frame.hasErrors"
                                                class="view-result help">
                                                <div play-src="play-src"
                                                    class="play">
                                                    <article
                                                        class="guide ng-scope">
                                                    <div
                                                        class="container-fluid">
                                                        <div class="row">
                                                            <div
                                                                class="col-sm-3">
                                                                <div
                                                                    class="box-max">
                                                                    <img
                                                                        src="../images/neo4j-world.png"
                                                                        class="img-responsive">
                                                                    <p
                                                                        class="lead text-center ng-binding">2.3.2
                                                                        -
                                                                        COMMUNITY</p>
                                                                </div>
                                                            </div>
                                                            <div
                                                                class="col-sm-9">
                                                                <div
                                                                    class="teaser teaser-3">
                                                                    <h3>Learn
                                                                        about
                                                                        Neo4j</h3>
                                                                    <p
                                                                        class="lead">A
                                                                        graph
                                                                        epiphany
                                                                        awaits
                                                                        you.</p>
                                                                    <div
                                                                        class="icon-holder">
                                                                        <img
                                                                            src="../images/learn-icon.png"
                                                                            class="icon">
                                                                        <ul
                                                                            class="topic-bullets">
                                                                            <li>What
                                                                                is
                                                                                a
                                                                                graph
                                                                                database?</li>
                                                                            <li>How
                                                                                can
                                                                                I
                                                                                query
                                                                                a
                                                                                graph?</li>
                                                                            <li>What
                                                                                do
                                                                                people
                                                                                do
                                                                                with
                                                                                Neo4j?</li>
                                                                        </ul>
                                                                        <div
                                                                            class="clearfix"></div>
                                                                    </div>
                                                                    <button
                                                                        play-topic="concepts"
                                                                        class="btn btn-cta">Start
                                                                        Learning</button>
                                                                </div>
                                                                <div
                                                                    class="teaser teaser-3">
                                                                    <h3>Jump
                                                                        into
                                                                        code</h3>
                                                                    <p
                                                                        class="lead">Use
                                                                        Cypher,
                                                                        the
                                                                        graph
                                                                        query
                                                                        language.</p>
                                                                    <div
                                                                        class="icon-holder">
                                                                        <img
                                                                            src="../images/code-icon.png"
                                                                            class="icon">
                                                                        <ul
                                                                            class="topic-bullets">
                                                                            <li>Code
                                                                                walk-throughs</li>
                                                                            <li>RDBMS
                                                                                to
                                                                                Graph</li>
                                                                            <li>Query
                                                                                templates</li>
                                                                        </ul>
                                                                        <div
                                                                            class="clearfix"></div>
                                                                    </div>
                                                                    <button
                                                                        play-topic="write-code"
                                                                        class="btn btn-cta">Write
                                                                        Code</button>
                                                                </div>
                                                                <div
                                                                    class="teaser teaser-3">
                                                                    <h3>Monitor
                                                                        the
                                                                        system</h3>
                                                                    <p
                                                                        class="lead">Key
                                                                        system
                                                                        health
                                                                        and
                                                                        status
                                                                        metrics.</p>
                                                                    <div
                                                                        class="icon-holder">
                                                                        <img
                                                                            src="../images/health-icon.png"
                                                                            class="icon">
                                                                        <ul
                                                                            class="topic-bullets">
                                                                            <li>Disk
                                                                                utilization</li>
                                                                            <li>Cache
                                                                                activity</li>
                                                                            <li>Cluster
                                                                                health
                                                                                and
                                                                                status</li>
                                                                        </ul>
                                                                        <div
                                                                            class="clearfix"></div>
                                                                    </div>
                                                                    <button
                                                                        play-topic="sysinfo"
                                                                        class="btn btn-cta">Monitor</button>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div
                                                            class="hero-unit">
                                                            <p
                                                                ng-class="{'motd-bang': motd.callToAction.bang}">
                                                                <a
                                                                    href="http://neo4j.com/blog/your-perfect-mix-tape-for-original-art-artfinder-neo4j/?utm_source=browser&amp;utm_medium=motd&amp;utm_content=blog&amp;utm_campaign=browser"
                                                                    class="ng-binding"
                                                                    target="_blank">Latest
                                                                    Blog:
                                                                    Your
                                                                    Perfect
                                                                    Mix
                                                                    Tape
                                                                    for
                                                                    Original
                                                                    Art:
                                                                    Artfinder
                                                                    +
                                                                    Neo4j</a>
                                                            </p>
                                                        </div>
                                                        <footer
                                                            class="tight">
                                                        <p
                                                            class="text-muted">
                                                            Copyright ©<a
                                                                href="http://neo4j.com/"
                                                                class="no-icon"
                                                                target="_blank">
                                                                Neo
                                                                Technology</a>&nbsp;2002–<span>2016</span>
                                                        </p>
                                                        </footer>
                                                    </div>
                                                    </article>
                                                </div>
                                            </div>
                                            <div
                                                ng-show="frame.hasErrors"
                                                class="view-result-error help ng-hide">
                                                <pre>No such topic to play.</pre>
                                            </div>
                                            <div
                                                ng-class="{error: frame.hasErrors, loading: frame.isLoading}"
                                                ng-show="frame.errorText.length"
                                                class="status-bar ng-hide">
                                                <div
                                                    ng-hide="frame.isLoading"
                                                    class="status ng-binding">
                                                    <span
                                                        ng-show="frame.hasErrors"
                                                        class="ng-hide">
                                                        <div
                                                            class="fa fa-exclamation-triangle icon-warning-sign">&nbsp;</div>
                                                    </span>false
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- end ngRepeat: frame in frames.items | orderBy:["-pinTime", "-startTime"] -->
                    </div>
                </div>
            </div>
        </div>
        <div id="diagnostics" ng-show="showVizDiagnostics"
            class="ng-hide">
            <div class="ng-binding">frames/s; costs:</div>
        </div>
        <div id="error" class="ng-binding"></div>
    </div>
    <script type="text/javascript" async=""
        src="https://widget.intercom.io/widget/lq70afwx"></script>
    <script id="template/popover/popover.html" type="text/ng-template">
      <div ng-class="{ in: isOpen(), fade: animation()}" class="popover {{placement}}">
        <div class="arrow"></div>
        <div class="popover-inner">
          <h3 ng-bind="title" ng-show="title" class="popover-title"></h3>
          <div ng-bind-html-unsafe="content" class="popover-content"></div>
        </div>
      </div>
    </script>
    <script id="template/tooltip/tooltip-popup.html"
        type="text/ng-template"><div class="tooltip {{placement}}" ng-class="{ in: isOpen(), fade: animation() }">
  <div class="tooltip-arrow"></div>
  <div class="tooltip-inner" ng-bind="content"></div>
</div>

    </script>
    <script id="template/tabs/tab.html" type="text/ng-template"><li ng-class="{active: active, disabled: disabled}">
  <a href ng-click="select()" tab-heading-transclude>{{heading}}</a>
</li>

    </script>
    <script id="template/tabs/tabset.html" type="text/ng-template"><div>
  <ul class="nav nav-{{type || 'tabs'}}" ng-class="{'nav-stacked': vertical, 'nav-justified': justified}" ng-transclude></ul>
  <div class="tab-content">
    <div class="tab-pane" 
         ng-repeat="tab in tabs" 
         ng-class="{active: tab.active}"
         tab-content-transclude="tab">
    </div>
  </div>
</div>

    </script>
    <script id="popup-styling" type="text/ng-template">
      <div id="grass" ng-controller="StylePreviewCtrl">
        <div class="modal-header"><a ng-click="togglePopup()" class="close pull-right">&times;</a>
          <ul class="list-inline">
            <li>
              <h3 style="display:inline;">Graph Style Sheet</h3>
            </li>
            <li><a exportable ng-click="exportGraSS(code)" tooltip-placement="bottom" tooltip="Export to file" class="fa fa-download"></a></li>
            <li><a exportable ng-click="reset()" tooltip-placement="bottom" tooltip="Reset to default style" class="fa fa-fire-extinguisher"></a></li>
          </ul>
        </div>
        <div class="modal-body">
          <textarea ng-model="code" disabled></textarea>
          <file-upload upload="import($content)" message="Drop a grass-file here to import">&nbsp;</file-upload>
        </div>
      </div>
    </script>
    <script id="template/modal/window.html" type="text/ng-template"><div tabindex="-1" role="dialog" class="modal fade" ng-class="{in: animate}" ng-style="{'z-index': 1050 + index*10, display: 'block'}" ng-click="close($event)">
    <div class="modal-dialog" ng-class="{'modal-sm': size == 'sm', 'modal-lg': size == 'lg'}"><div class="modal-content" modal-transclude></div></div>
</div>
    </script>
    <script id="template/modal/backdrop.html" type="text/ng-template"><div class="modal-backdrop fade {{ backdropClass }}"
     ng-class="{in: animate}"
     ng-style="{'z-index': 1040 + (index && 1 || 0) + index*10}"
></div>

    </script>
    <script id="inspector/graphItem.html" type="text/ng-template">
      <ul class="list-inline">
        <li ng-if="item.isNode" ng-repeat="label in item.labels">
          <div ng-style="styleForLabel(label)" ng-bind="label" class="token token-label"></div>
        </li>
        <li ng-if="!item.isNode">
          <div ng-style="styleForItem(item)" ng-bind="item.type" class="token token-relationship-type"></div>
        </li>
        <li ng-if="item.propertyList.length == 0" class="empty">No properties</li>
        <li class="pair">
          <div ng-bind-template="&lt;id&gt;: " class="key"></div>
          <div ng-bind="item.id" class="value"></div>
        </li>
        <li ng-repeat="property in item.propertyList" class="pair">
          <div ng-bind-template="{{property.key}}: " class="key"></div>
          <div ng-bind="property.value" class="value"></div>
        </li>
      </ul>
    </script>
    <script id="inspector/label.html" type="text/ng-template">
      <ul class="list-inline">
        <li class="inspector-icon">
          <div ng-style="{&quot;background-color&quot;: item.style.props.color, &quot;color&quot;: item.style.props[&quot;text-color-internal&quot;]}" class="token token-label">{{item.label || '*'}}</div>
        </li>
        <li class="colors">
          <ul class="list-inline">
            <li>Color:</li>
            <li ng-repeat="scheme in colors"><a ng-style="{&quot;background-color&quot;: scheme.color}" ng-class="{active: scheme.color == item.style.props.color &amp;&amp; scheme[&quot;border-color&quot;] == item.style.props[&quot;border-color&quot;]}" ng-click="selectScheme(item, scheme)"></a></li>
          </ul>
        </li>
        <li class="node-sizes">
          <ul class="list-inline">
            <li>Size:</li>
            <li ng-repeat="size in sizes"><a ng-class="{active: sizeLessThan(size.diameter, item.style.props.diameter)}" ng-style="nodeDisplaySize($index)" ng-click="selectSize(item, size)"></a></li>
          </ul>
        </li>
        <li class="attributes">
          <ul class="list-inline">
            <li>Caption:</li>
            <li><a ng-click="selectCaption(item, &quot;&lt;id&gt;&quot;)" ng-class="{selected: isSelectedCaption(item, '&lt;id&gt;')}" class="attribute">&lt;id&gt;</a></li>
            <li ng-repeat="property in item.attrs"><a ng-click="selectCaption(item, &quot;{&quot; + property + &quot;}&quot;)" ng-bind="property" ng-class="{selected: isSelectedCaption(item, '{' + property + '}')}" class="attribute"></a></li>
          </ul>
        </li>
      </ul>
    </script>
    <script id="inspector/relationshipType.html" type="text/ng-template">
      <ul class="list-inline">
        <li class="inspector-icon">
          <div ng-style="{&quot;background-color&quot;: item.style.props.color, &quot;color&quot;: item.style.props[&quot;text-color-internal&quot;]}" class="token token-relationship-type">{{item.type  || '*'}}</div>
        </li>
        <li class="colors">
          <ul class="list-inline">
            <li>Color:</li>
            <li ng-repeat="scheme in colors"><a ng-style="{&quot;background-color&quot;: scheme.color}" ng-class="{active: scheme.color == item.style.props.color &amp;&amp; scheme[&quot;border-color&quot;] == item.style.props[&quot;border-color&quot;]}" ng-click="selectScheme(item, scheme)"></a></li>
          </ul>
        </li>
        <li class="arrow-widths">
          <ul class="list-inline">
            <li>Size:</li>
            <li ng-repeat="arrowWidth in arrowWidths"><a ng-style="arrowDisplayWidth($index)" ng-class="{active: arrowWidth[&quot;shaft-width&quot;] == item.style.props[&quot;shaft-width&quot;]}" ng-click="selectArrowWidth(item, arrowWidth)"></a></li>
          </ul>
        </li>
        <li class="attributes">
          <ul class="list-inline">
            <li>Caption:</li>
            <li><a ng-click="selectCaption(item, &quot;&lt;id&gt;&quot;)" ng-class="{selected: isSelectedCaption(item, '&lt;id&gt;')}" class="attribute">&lt;id&gt;</a></li>
            <li><a ng-click="selectCaption(item, &quot;&lt;type&gt;&quot;)" ng-class="{selected: isSelectedCaption(item, '&lt;type&gt;')}" class="attribute">&lt;type&gt;</a></li>
            <li ng-repeat="property in item.attrs"><a ng-click="selectCaption(item, &quot;{&quot; + property + &quot;}&quot;)" ng-bind="property" ng-class="{selected: isSelectedCaption(item, '{' + property + '}')}" class="attribute"></a></li>
          </ul>
        </li>
      </ul>
    </script>
    <script id="template/carousel/carousel.html" type="text/ng-template">
      <div ng-mouseenter="pause()" ng-mouseleave="play()" no-ng-animate class="carousel">
        <div class="carousel-indicators-wrapper">
          <ol ng-show="slides.length &gt; 1" class="carousel-indicators">
            <li ng-repeat="slide in slides track by $index" ng-class="{active: isActive(slide)}" ng-click="select(slide)"></li>
          </ol>
        </div>
        <div ng-transclude class="carousel-inner"></div><a ng-click="prev()" ng-show="slides.length &gt; 1 &amp;&amp; !slides[0].active" class="carousel-control left">&lsaquo;</a><a ng-click="next()" ng-show="slides.length &gt; 1 &amp;&amp; !slides[slides.length - 1].active" class="carousel-control right">&rsaquo;</a>
      </div>
    </script>
    <script id="template/carousel/slide.html" type="text/ng-template">
      <div ng-class="{ 'active': leaving || (active &amp;&amp; !entering), 'prev': (next || active) &amp;&amp; direction=='prev', 'next': (next || active) &amp;&amp; direction=='next', 'right': direction=='prev',  'left': direction=='next'  }" ng-transclude class="item"></div>
    </script>
    <!-- banner for going to webadmin, only if needed-->
    <div ng-hide="goodBrowser" class="ng-hide">
        <div
            style="position: fixed; bottom: 0; right: 0; border: 0; z-index: 998">
            <a href="../webadmin"><img
                src="../images/webadmin-banner.png"
                alt="Switch to Classic UI"></a>
        </div>
        <div
            style="position: fixed; bottom: 0; right: 0; border: 0; z-index: 999">
            <a ng-click="hideWebadminBanner = true"><img
                src="../images/dismiss.png" alt="Dismiss"></a>
        </div>
    </div>
    <script src="../scripts/8537a860.components.js"></script>
    <script src="../scripts/ded362b3.scripts.js"></script>

    <div class="fullscreen-container" style="display: none;"></div>
    <iframe style="display: none;"></iframe>
</body>
</body>
</html>