<!DOCTYPE html>
<html lang="{{ LOCALE }}" class="h-100">
  <head data-locale="{{ LOCALE }}">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1">

    {% if NEW_RELIC_SCRIPT %}
      {{ NEW_RELIC_SCRIPT|raw }}
    {% endif %}

    {% if GOOGLECLIENTID %}
      <meta name="google-signin-client_id" content="{{ GOOGLECLIENTID }}" />
    {% endif %}

    <script type="text/javascript" src="{% versionHash '/js/error_handler.js' %}"></script>
    <title>{{ title }} &ndash; omegaUp</title>
    <script type="text/javascript" src="{% versionHash '/third_party/js/jquery-3.5.1.min.js' %}"></script>
    <script type="text/javascript" src="{% versionHash '/js/jquery_error_handler.js' %}"></script>
    <script type="text/javascript" src="{% versionHash '/third_party/js/highstock.js' %}" defer></script>
    {% jsInclude 'omegaup' %}

    {% if jsfile %}
      <script type="text/javascript" src="{{ jsfile }}" defer></script>
    {% endif %}

    {% if scripts %}
      {% for script in scripts %}
        <script type="text/javascript" src="{{ script }}" defer async></script>
      {% endfor %}
    {% endif %}

    <!-- Bootstrap 4 -->
    <link rel="stylesheet" href="/third_party/bootstrap-4.5.0/css/bootstrap.min.css"/>
    <script src="/third_party/bootstrap-4.5.0/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" type="text/css" href="{% versionHash '/css/dist/omegaup_styles.css' %}">
    <link rel="shortcut icon" href="/favicon.ico" />

    {% if ENABLED_EXPERIMENTS %}
        <script type="text/plain" id="omegaup-enabled-experiments">{{ ENABLED_EXPERIMENTS|join(',') }}</script>
    {% endif %}

    {% if recaptchaFile %}
        <script type="text/javascript" src="{{ recaptchaFile }}"></script>
    {% endif %}
    
    <!-- Dark mode initialization -->
    <script type="text/javascript" src="{% versionHash '/js/dark_mode.js' %}"></script>
    
    <style>
      /* Dark theme styles */
      :root {
        --light-background-color: #fff;
        --light-text-color: #212529;
        --light-card-bg: #fff;
        --light-border-color: #ddd;
        --light-link-color: #007bff;
        --light-input-bg: #fff;
        --light-input-color: #495057;
        --light-input-border: #ced4da;
      }
      
      .dark-theme {
        --background-color: #222;
        --text-color: #eee;
        --card-bg: #333;
        --border-color: #555;
        --link-color: #6bf;
        --btn-primary-bg: #0069d9;
        --btn-primary-color: white;
        --btn-secondary-bg: #555;
        --btn-secondary-color: white;
        --input-bg: #444;
        --input-color: #eee;
        --input-border: #666;
        --dropdown-bg: #333;
        --dropdown-link-color: #eee;
        --dropdown-link-hover-bg: #444;
        --dropdown-link-hover-color: #fff;
        --header-bg: #2a2a2a;
        --code-bg: #333;
        --code-color: #f8f8f2;
        --table-bg: #2d2d2d;
        --modal-bg: #333;
        --tooltip-bg: #444;
        --tooltip-color: #eee;
        --panel-bg: #2d2d2d;
      }
      
      /* Default light theme variables */
      body, html {
        background-color: var(--light-background-color);
        color: var(--light-text-color);
      }
      
      html.dark-theme,
      body.dark-theme,
      .dark-theme body {
        background-color: var(--background-color) !important;
        color: var(--text-color) !important;
      }
      
      /* Cards, panels, containers */
      .dark-theme .card,
      .dark-theme .navbar,
      .dark-theme .alert:not(.alert-warning):not(.alert-danger):not(.alert-success):not(.alert-info),
      .dark-theme .list-group-item,
      .dark-theme .modal-content,
      .dark-theme .popover,
      .dark-theme .dropdown-menu,
      .dark-theme .card-header,
      .dark-theme .card-footer,
      .dark-theme .panel,
      .dark-theme .panel-default,
      .dark-theme .panel-heading,
      .dark-theme .well,
      .dark-theme .modal-header,
      .dark-theme .modal-body,
      .dark-theme .modal-footer {
        background-color: var(--card-bg) !important;
        border-color: var(--border-color) !important;
        color: var(--text-color) !important;
      }
      
      /* Problems page specific fixes */
      .dark-theme .problem-list, 
      .dark-theme .panel-body,
      .dark-theme .panel-default>.panel-heading,
      .dark-theme .panel-footer,
      .dark-theme .problem,
      .dark-theme .problem-header,
      .dark-theme .statement,
      .dark-theme .tab-content,
      .dark-theme .problem-statement,
      .dark-theme .problem-footer,
      .dark-theme .submissions,
      .dark-theme .container.wait,
      .dark-theme pre,
      .dark-theme code {
        background-color: var(--card-bg) !important;
        color: var(--text-color) !important;
        border-color: var(--border-color) !important;
      }
      
      /* Links */
      .dark-theme a:not(.btn),
      .dark-theme .breadcrumb a,
      .dark-theme .nav-link,
      .dark-theme .navbar-brand {
        color: var(--link-color) !important;
      }
      
      /* Buttons */
      .dark-theme .btn-primary {
        background-color: var(--btn-primary-bg) !important;
        color: var(--btn-primary-color) !important;
      }
      
      .dark-theme .btn-secondary,
      .dark-theme .btn-default {
        background-color: var(--btn-secondary-bg) !important;
        color: var(--btn-secondary-color) !important;
      }
      
      /* Form elements */
      .dark-theme input,
      .dark-theme select,
      .dark-theme textarea,
      .dark-theme .form-control,
      .dark-theme .custom-select,
      .dark-theme .input-group-text {
        background-color: var(--input-bg) !important;
        color: var(--input-color) !important;
        border-color: var(--input-border) !important;
      }
      
      /* Dropdown menus */
      .dark-theme .dropdown-item,
      .dark-theme .dropdown-header {
        color: var(--dropdown-link-color) !important;
        background-color: var(--dropdown-bg) !important;
      }
      
      .dark-theme .dropdown-item:hover,
      .dark-theme .dropdown-item:focus {
        color: var(--dropdown-link-hover-color) !important;
        background-color: var(--dropdown-link-hover-bg) !important;
      }
      
      /* Tables */
      .dark-theme .table,
      .dark-theme table {
        color: var(--text-color) !important;
        background-color: var(--table-bg) !important;
      }
      
      .dark-theme .table td,
      .dark-theme .table th,
      .dark-theme table td,
      .dark-theme table th {
        border-color: var(--border-color) !important;
      }
      
      .dark-theme .table-striped tbody tr:nth-of-type(odd) {
        background-color: rgba(255, 255, 255, 0.05) !important;
      }
      
      .dark-theme .table-hover tbody tr:hover {
        background-color: rgba(255, 255, 255, 0.1) !important;
      }
      
      /* Code elements */
      .dark-theme pre,
      .dark-theme code {
        background-color: var(--code-bg) !important;
        color: var(--code-color) !important;
      }
      
      /* Navbar and navigation */
      .dark-theme .bg-light,
      .dark-theme .bg-white {
        background-color: var(--header-bg) !important;
      }
      
      .dark-theme .nav-tabs .nav-link.active,
      .dark-theme .nav-tabs .nav-item.show .nav-link {
        color: var(--text-color) !important;
        background-color: var(--card-bg) !important;
        border-color: var(--border-color) var(--border-color) var(--card-bg) !important;
      }
      
      /* Badges and labels */
      .dark-theme .badge:not(.badge-success):not(.badge-warning):not(.badge-danger):not(.badge-info):not(.badge-primary),
      .dark-theme .label:not(.label-success):not(.label-warning):not(.label-danger):not(.label-info):not(.label-primary) {
        background-color: var(--btn-secondary-bg) !important;
        color: var(--text-color) !important;
      }
      
      /* Tooltips and popovers */
      .dark-theme .tooltip-inner {
        background-color: var(--tooltip-bg) !important;
        color: var(--tooltip-color) !important;
      }
      
      /* Override specific elements with !important */
      .dark-theme .bg-white,
      .dark-theme .bg-light,
      .dark-theme [class*="bg-white"],
      .dark-theme [class*="bg-light"],
      .dark-theme .container.wait,
      .dark-theme .main-container,
      .dark-theme .main-content {
        background-color: var(--background-color) !important;
      }
    </style>
  </head>

  <body class="d-flex flex-column h-100{% if OMEGAUP_LOCKDOWN %} lockdown{% endif %}">
    <script type="text/json" id="header-payload">{{ headerPayload|json_encode|raw }}</script>
    {% jsInclude 'common_navbar' omitRuntime %}
    {% if not hideFooterAndHeader %}
      <div id="common-navbar"></div>
    {% endif %}
    <main role="main" {% if not fullWidth %}class="container-lg py-5 px-3 px-md-5"{% endif %}>
      <div class="alert mt-0" id="status" style="display: none;">
        <button type="button" class="close" id="alert-close">&times;</button>
        <span class="message"></span>
      </div>
      {% if OMEGAUP_MAINTENANCE %}
        <div id="announcement" class="alert alert-info mt-0">
          {{ OMEGAUP_MAINTENANCE|raw }}
        </div>
      {% endif %}

      <script type="text/json" id="payload">{{ payload|json_encode|raw }}</script>
      {% entrypoint %}
      <div id="main-container"></div>
    </main>
    {% if OMEGAUP_GA_TRACK == 1 %}
      <script async src="https://www.googletagmanager.com/gtag/js?id=G-PBDCQK1GEQ"></script>
      <script type="text/javascript" src="{% versionHash '/js/analytics.js' %}"></script>
    {% endif %}
    {% jsInclude 'common_scroll_to_top' omitRuntime %}
      <div id="scroll-to-top"></div>
    {% jsInclude 'common_footer' omitRuntime %}
    {% if not headerPayload.inContest and not hideFooterAndHeader %}
      <div id="common-footer"></div>
    {% endif %}

  </body>
  <script type="text/javascript" src="{% versionHash '/js/status.dismiss.js' %}" defer></script>
</html>
