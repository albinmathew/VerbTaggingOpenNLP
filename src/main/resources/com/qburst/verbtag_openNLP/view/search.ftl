<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Search::Home</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <!-- start: CSS -->
    <link href="assets/css/bootstrap.min.css" rel="stylesheet">
    <link href="assets/css/style.min.css" rel="stylesheet">
    <link href="assets/css/retina.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="js/lib/validity/css/jquery.validity.css">

    <!-- end: CSS -->


    <!-- The HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>

    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <script src="assets/js/respond.min.js"></script>
    <script src="assets/css/ie6-8.css"></script>

    <![endif]-->

    <style type="text/css">

        #text {
            margin: 75px auto;
        }

        .chat .conversation {
            width: 100%

        }

        .chat .conversation ul {
            height: 250px;
        }

        h2 {
            font-size: 18px;
            line-height: 14px;
            font-weight: 300;
            padding-left: 5px;
        }

        .navbar-brand {
            height: 40px;
        }

        .navbar-default .navbar-brand {
            color: #FFFFFF;
        }

        a.navbar-brand {
            background: #36a9e1;
        }

        #loading-mask {
            position: absolute;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            z-index: 20000;
            background-color: white;
        }

        #loading {
            position: absolute;
            left: 45%;
            top: 40%;
            padding: 2px;
            z-index: 20001;
        }

        #loading .loading-indicator {
            background: white;
            color: #555;
            font: bold 13px tahoma, arial, helvetica;
            padding: 10px;
            margin: 0;
            text-align: center;
            height: auto;
        }
    </style>

    <script type="text/javascript">
        function removeElementById(el) {
            var node = document.getElementById(el);
            if (node) {
                node.parentNode.removeChild(node);
            }
        }
        function removeLoading() {
            removeElementById("loading");
            removeElementById("loading-mask");
        }
    </script>

</head>

<body>

<div class="container">
    <div class="nav-container " data-active="">
        <nav class="navbar navbar-default navbar-fixed-top" role="navigation">

            <a class="navbar-brand" href="/">Search Verbs</a>
        </nav>
    </div>
    <div id="text" class="row">

        <div class="col-lg-12 col-sm-11">

            <div class="row">
                <div class="col-lg-12">

                    <div class="box">
                        <div class="box-header">
                            <h2>Enter your Text</h2>
                        </div>
                        <div class="box-content" style="display: block;">
                            <form role="form" method="post" action="">

                                <div class="form-group">

                                    <div class="controls">
                                        <textarea name="field" class="form-control search-query" id="search-query-input"
                                                  rows="4"
                                                  style="width: 100%; overflow: hidden; word-wrap: break-word; resize: horizontal; height: 100px;"></textarea>
                                    </div>
                                </div>

                                <div class="form-actions">
                                    <button type="submit" class="btn btn-primary" id="gobutton">Analyze</button>
                                    <button type="reset" class="btn">Reset</button>

                            </form>

                        </div>

                    </div>
                </div>
            </div>

        </div>

        <div class="row">


            <div class=" col-md-12">

                <div class="box noOverflow chat col-md-6 ">

                    <div class="conversation">
                        <ul class="talk">
                            <li>
                                <span class="name" id="results">Verbs</span>

                                <div class="message" id="results-time">${results} </div>
                                <div id="loading-mask" style=""></div>
                                <div id="loading">
                                    <div class="loading-indicator"><img
                                            src="http://extjs.cachefly.net/ext-2.3.0/resources/images/default/shared/large-loading.gif"
                                            width="32" height="32" style="margin-right:8px;" align="absmiddle"/>Loading...
                                    </div>
                                </div>

                                <script type="text/javascript">
                                    setTimeout("removeLoading()", 1000);
                                </script>
                            </li>
                        </ul>
                    </div>
                </div>

                <div class="col-md-6">


                    <div class="box noOverflow chat">

                        <div class="conversation">
                            <ul class="talk">
                                <li>
                                    <span class="name" id="results-grammar">Modified Result</span>

                                    <div class="message" id="results-time">${verbs} </div>
                                    <div id="loading-mask" style=""></div>
                                    <div id="loading">
                                        <div class="loading-indicator"><img
                                                src="http://extjs.cachefly.net/ext-2.3.0/resources/images/default/shared/large-loading.gif"
                                                width="32" height="32" style="margin-right:8px;" align="absmiddle"/>Loading...
                                        </div>
                                    </div>

                                    <script type="text/javascript">
                                        setTimeout("removeLoading()", 1000);
                                    </script>
                                    <div class="message"></div>
                                </li>
                            </ul>
                        </div>


                    </div>

                </div>


            </div>
        </div>
    </div>
</div>
</div>


<!-- start: JavaScript-->
<!--[if !IE]>-->

<script src="assets/js/jquery-2.1.0.min.js"></script>

<!--<![endif]-->

<!--[if IE]>

<script src="assets/js/jquery-1.11.0.min.js"></script>

<![endif]-->

<!--[if !IE]>-->

<script type="text/javascript">
    window.jQuery || document.write("<script src='assets/js/jquery-2.1.0.min.js'>" + "<" + "/script>");
</script>

<!--<![endif]-->

<!--[if IE]>

<script type="text/javascript">
    window.jQuery || document.write("<script src='assets/js/jquery-1.11.0.min.js'>" + "<" + "/script>");
</script>

<![endif]-->
<script src="assets/js/jquery-migrate-1.2.1.min.js"></script>
<script src="assets/js/bootstrap.min.js"></script>


<!-- page scripts -->
<script type="text/javascript" src="js/lib/underscore/js/underscore-min.js"></script>
<script type="text/javascript" src="js/lib/backbone/js/backbone-min.js"></script>
<script type="text/javascript" src="js/lib/validity/js/jquery.validity.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="assets/js/jquery.autosize.min.js"></script>
<script src="assets/js/jquery.placeholder.min.js"></script>
<script type="text/javascript" src="js/lib/lodash/js/lodash.min.js"></script>
<script type="text/javascript" src="js/search.js"></script>

<script src="assets/js/jquery.inputlimiter.1.3.1.min.js"></script>

<!-- inline scripts related to this page -->
<script src="assets/js/pages/form-elements.js"></script>
<!-- end: JavaScript-->


</body>
</html>