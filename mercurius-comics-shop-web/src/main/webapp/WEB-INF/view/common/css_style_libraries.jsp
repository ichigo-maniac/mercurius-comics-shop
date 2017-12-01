<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="A front-end template that helps you build fast, modern mobile web apps.">
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0">

<%-- CSRF --%>
<meta name="_csrf" content="${_csrf.token}"/>
<meta name="_csrf_header" content="${_csrf.headerName}"/>

<link rel="shortcut icon" href="/resources/app/icon/favicon.ico">


<link rel="stylesheet" href="/resources/app/css/material.min.css">
<link rel="stylesheet" href="/resources/lib/css/bootstrap.min.css"/>
<link rel="stylesheet" href="/resources/lib/css/bootstrap-theme.min.css"/>
<link rel="stylesheet" href="/resources/lib/css/bootstrap-select.min.css"/>
<link rel="stylesheet" href="/resources/lib/css/bootstrap.alertify.min.css"/>
<link rel="stylesheet" href="/resources/lib/css/alertify.min.css"/>
<link rel="stylesheet" href="/resources/lib/css/bootstrap-slider.min.css"/>
<link rel="stylesheet" href="/resources/app/css/styles.css"/>
<link rel="stylesheet" href="/resources/app/css/common.css"/>
<style>
    #view-source {
        position: fixed;
        display: block;
        right: 0;
        bottom: 0;
        margin-right: 40px;
        margin-bottom: 40px;
        z-index: 900;
    }
</style>