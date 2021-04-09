<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DeliveryChain.ascx.cs" Inherits="WebApplicationAssigment.pages.main.Delivery.widget.DeliveryChain" %>

<style>
    
ul.timeline {
    list-style-type: none;
    position: relative;
}
ul.timeline:before {
    content: ' ';
    background: #d4d9df;
    display: inline-block;
    position: absolute;
    left: 29px;
    width: 2px;
    height: 100%;
    z-index: 400;
}
ul.timeline > li {
    margin: 20px 0;
    padding-left: 20px;
}
ul.timeline > li:before {
    content: ' ';
    background: white;
    display: inline-block;
    position: absolute;
    border-radius: 50%;
    border: 3px solid #888;
    left: 20px;
    width: 20px;
    height: 20px;
    z-index: 400;
}

ul.timeline > li.active:before {
    background-color: #8bc34a!important;
    border: 3px solid #4CAF50;
}
ul.timeline > li.complete:before {
    background-color: #8bc34a!important;
}
</style>

<ul class="timeline">
    <li class="complete"><a href="#" class="pull-right">December 09 05:51 AM</a>
        Source Location: <a target="_blank" href="https://maps.google.com/?q=3.1227904,101.76102399999999">7, Jalan 29/1, Taman Putra, 68000 Ampang, Selangor...</a>:
        <br>
        <p>
            Status: %status%<br>
            Notes: %notes%<br>
        </p>
    </li>
    <li class="active"><a href="#" class="pull-right">December 09 05:51 AM</a>
        Reach Location: <a target="_blank" href="https://maps.google.com/?q=3.1227904,101.76102399999999">7, Jalan 29/1, Taman Putra, 68000 Ampang, Selangor...</a>:
        <br>
        <p>
            Status: %status%<br>
            Notes: %notes%<br>
        </p>
    </li>
    <li class="">
        <a href="#" class="pull-right">December 09 05:41 AM</a>
        Destination Location: <a target="_blank" href="https://maps.google.com/?q=3.1263944794870904,101.70955685576234">6-4-10, Jln Lapangan Permai 1, Pudu, 57100 Kuala L...</a><br><br>
        <p>
            Status: %status%<br>
            Notes: %notes%<br>
        </p>
    </li>
</ul>
