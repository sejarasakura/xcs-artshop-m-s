<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="StartPageSM.ascx.cs"  Inherits="WebApplicationAssigment.pages.widget.StartPageSM"  %>

 <div style="border-color:#FFF" class="tatsu-action-backgorund-sk tatsu-section  tatsu-bg-overlay   tatsu-clearfix" data-title="" data-headerscheme="background--dark">
    
    <div class="tatsu-section-pad clearfix" data-padding="{&quot;d&quot;:&quot;10px 0px 10px 0px&quot;}" data-padding-top="1px">
    </div>
    <div class="tatsu-section-background-wrap">
        <div class="tatsu-section-background tatsu-bg-lazyload tatsu-bg-lazyloaded" data-src="<%= "https://" + HttpContext.Current.Request.Url.Authority%>/assets/image/background/sky-bg.jpg"></div>
    </div>
    <div class="tatsu-overlay tatsu-section-overlay"></div>
    <div class="tatsu-shape-divider tatsu-bottom-divider">
        <svg preserveAspectRatio="none" xmlns="http://www.w3.org/2000/svg" width="1920" height="217" viewBox="0 0 1920 217">
            <g fill-rule="evenodd" transform="matrix(-1 0 0 1 1920 0)">
                <path d="M0,57.46875 C203.364583,135.217754 494.835938,156.564108 874.414062,121.507813 C1192.61198,-13.9827666 1541.14063,-35.3291208 1920,57.46875 L1920,207 L0,207 L0,57.46875 Z" opacity=".3"></path>
                <path d="M0,79 C292.46875,165.453125 612.46875,165.453125 960,79 C1307.53125,-7.453125 1627.53125,-7.453125 1920,79 L1920,207 L0,207 L0,79 Z" opacity=".6"></path>
                <path d="M0,89 C288.713542,146.786458 608.713542,146.786458 960,89 C1311.28646,31.2135417 1631.28646,31.2135417 1920,89 L1920,217 L0,217 L0,89 Z"></path>
            </g>
        </svg>
    </div>
    <style>
        .tatsu-row > .tatsu-screen.tatsu-column {
            width: 100%;
        }

        .tatsu-screen.tatsu-column > .tatsu-column-inner > .tatsu-column-overlay {
            mix-blend-mode: none;
        }

        .tatsu-screen > .tatsu-column-inner > .tatsu-top-divider {
            z-index: 9999;
        }

        .tatsu-screen > .tatsu-column-inner > .tatsu-bottom-divider {
            z-index: 9999;
        }

        .tatsu-screen > .tatsu-column-inner > .tatsu-left-divider {
            z-index: 9999;
        }

        .tatsu-screen > .tatsu-column-inner > .tatsu-right-divider {
            z-index: 9999;
        }

        @media only screen and (max-width:1377px) {
            .tatsu-row > .tatsu-screen.tatsu-column {
                width: 100%;
            }
        }

        @media only screen and (min-width:768px) and (max-width: 1024px) {
            .tatsu-row > .tatsu-screen.tatsu-column {
                width: 100%;
            }
        }

        @media only screen and (max-width: 767px) {
            .tatsu-row > .tatsu-screen.tatsu-column {
                width: 100%;
            }
        }
        .tatsu-background-screen-sk .tatsu-inline-text-inner {
            width: 55%;
            text-align: left;
        }

        .tatsu-background-screen-sk.tatsu-inline-text {
            margin: 0px 0px 15px 0px;
        }

        @media only screen and (min-width:768px) and (max-width: 1024px) {
            .tatsu-background-screen-sk .tatsu-inline-text-inner {
                width: 80%;
            }
        }

        @media only screen and (max-width: 767px) {
            .tatsu-background-screen-sk .tatsu-inline-text-inner {
                width: 100%;
            }
        }
        .tatsu-background-screen-sk2 .tatsu-inline-text-inner {
            width: 40%;
            text-align: left;
        }

        @media only screen and (min-width:768px) and (max-width: 1024px) {
            .tatsu-background-screen-sk2 .tatsu-inline-text-inner {
                width: 80%;
            }
        }

        @media only screen and (max-width: 767px) {
            .tatsu-background-screen-sk2 .tatsu-inline-text-inner {
                width: 100%;
            }
        }
        .tatsu-action-backgorund-sk.tatsu-section {
            background-color: #f2eeed;
        }

        .tatsu-action-backgorund-sk .tatsu-section-background {
            background-image: url(https://exponentwptheme.com/corporate/wp-content/uploads/sites/2/2018/07/About-Hero-.jpg);
            background-repeat: no-repeat;
            background-attachment: scroll;
            background-position: center center;
            background-size: cover;
        }

        .tatsu-action-backgorund-sk .tatsu-bg-blur {
            background-repeat: no-repeat;
            background-attachment: scroll;
            background-position: center center;
            background-size: cover;
        }

        .tatsu-action-backgorund-sk .tatsu-section-pad {
            padding: 15px 0px 10px 0px;
        }

        .tatsu-action-backgorund-sk > .tatsu-bottom-divider {
            height: 100px;
            color: #ffffff;
            z-index: 9999;
        }

        .tatsu-action-backgorund-sk > .tatsu-top-divider {
            z-index: 9999;
        }

        .tatsu-action-backgorund-sk .tatsu-section-overlay {
            background: rgba(34,147,215,0.7);
            mix-blend-mode: normal;
        }
    </style>
</div>