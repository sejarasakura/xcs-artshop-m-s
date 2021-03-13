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
    border: 3px solid #22c0e8;
}
</style>

<ul class="timeline">
    <li class="complete"><a href="#" class="pull-right">December 09 05:51 AM</a>From Location: <a target="_blank" href="https://maps.google.com/?q=3.1316996017746823,101.70681021699473">2, Jalan Gajus, Pudu, 50460 Kuala Lumpur, Wilayah ...</a><br>
        To Location: <a target="_blank" href="https://maps.google.com/?q=3.1227904,101.76102399999999">7, Jalan 29/1, Taman Putra, 68000 Ampang, Selangor...</a>:
        <br>
        <p>Booking id: <a href="#">#1000000059</a><br>
            Driver: Lim Sai Keat [d-saikeat9]
            <br>
            Status: Waiting Driver,Waiting a while, the driver is comming<br>
            <a target="_blank" href="http://localhost:8080/WebApplication/pages/chat.jsp?target=CS-100000073">Chat with Lim Sai Keat</a><br>
            Note to driver: </p>
    </li>
    <li class="active"><a href="#" class="pull-right">December 09 05:51 AM</a>From Location: <a target="_blank" href="https://maps.google.com/?q=3.1316996017746823,101.70681021699473">2, Jalan Gajus, Pudu, 50460 Kuala Lumpur, Wilayah ...</a><br>
        To Location: <a target="_blank" href="https://maps.google.com/?q=3.1227904,101.76102399999999">7, Jalan 29/1, Taman Putra, 68000 Ampang, Selangor...</a>:
        <br>
        <p>Booking id: <a href="#">#1000000058</a><br>
            Driver:
            <br>
            Status: Pairing,We are finding driver for you<br>
            <a target="_blank" href="http://localhost:8080/WebApplication/pages/chat.jsp?target=CS-100000072">Chat with </a>
            <br>
            Note to driver: </p>
    </li>
    <li><a href="#" class="pull-right">December 09 05:41 AM</a>From Location: <a target="_blank" href="https://maps.google.com/?q=3.1263944794870904,101.70955685576234">6-4-10, Jln Lapangan Permai 1, Pudu, 57100 Kuala L...</a><br>
        To Location: <a target="_blank" href="https://maps.google.com/?q=3.1227904,101.76102399999999">7, Jalan 29/1, Taman Putra, 68000 Ampang, Selangor...</a>:
        <br>
        <p>Booking id: <a href="#">#1000000057</a><br>
            Driver:
            <br>
            Status: Pairing,We are finding driver for you<br>
            <a target="_blank" href="http://localhost:8080/WebApplication/pages/chat.jsp?target=CS-100000071">Chat with </a>
            <br>
            Note to driver: Haha</p>
    </li>
    <li><a href="#" class="pull-right">December 09 05:41 AM</a>From Location: <a target="_blank" href="https://maps.google.com/?q=3.1282714958164064,101.70303366670176">Jalan Dewan Bahasa, Bukit Seputeh, 50460 Kuala Lum...</a><br>
        To Location: <a target="_blank" href="https://maps.google.com/?q=3.1227904,101.76102399999999">7, Jalan 29/1, Taman Putra, 68000 Ampang, Selangor...</a>:
        <br>
        <p>Booking id: <a href="#">#1000000055</a><br>
            Driver:
            <br>
            Status: Pairing,We are finding driver for you<br>
            <a target="_blank" href="http://localhost:8080/WebApplication/pages/chat.jsp?target=CS-100000069">Chat with </a>
            <br>
            Note to driver: Haha</p>
    </li>
    <li><a href="#" class="pull-right">December 09 05:05 AM</a>From Location: <a target="_blank" href="https://maps.google.com/?q=3.169754718376976,101.67255659528799">KL1036 Stadium Hoki, Bukit Tunku, 50480 Kuala Lump...</a><br>
        To Location: <a target="_blank" href="https://maps.google.com/?q=3.1728398912909834,101.75083418317861">3, Jalan AU 2a/18, Taman Keramat, 54200 Kuala Lump...</a>:
        <br>
        <p>Booking id: <a href="#">#1000000060</a><br>
            Driver:
            <br>
            Status: Pairing,We are finding driver for you<br>
            <a target="_blank" href="http://localhost:8080/WebApplication/pages/chat.jsp?target=CS-100000074">Chat with </a>
            <br>
            Note to driver: Faster come</p>
    </li>
    <li><a href="#" class="pull-right">December 09 12:02 AM</a>From Location: <a target="_blank" href="https://maps.google.com/?q=3.128275392824324,101.73445082094311">4th Floor, Wisma Maluri No. 5,, Jalan Jejaka, Malu...</a><br>
        To Location: <a target="_blank" href="https://maps.google.com/?q=3.1227904,101.76102399999999">7, Jalan 29/1, Taman Putra, 68000 Ampang, Selangor...</a>:
        <br>
        <p>Booking id: <a href="#">#1000000054</a><br>
            Driver: Lim Sai Keat [d-saikeat9]
            <br>
            Status: Waiting Driver,Waiting a while, the driver is comming<br>
            <a target="_blank" href="http://localhost:8080/WebApplication/pages/chat.jsp?target=CS-100000068">Chat with Lim Sai Keat</a><br>
            Note to driver: Chun pang faster pokai lo</p>
    </li>
    <li><a href="#" class="pull-right">December 07 08:07 AM</a>From Location: <a target="_blank" href="https://maps.google.com/?q=3.1402189577908293,101.71543409062753">Kdnf gdsibsg gsgsdgsg rgse </a>
        <br>
        To Location: <a target="_blank" href="https://maps.google.com/?q=3.1217110999999997,101.7579749">egse ghb esg esg</a>:
        <br>
        <p>Booking id: <a href="#">#1000000053</a><br>
            Driver: Lim Sai Keat [d-saikeat9]
            <br>
            Status: Waiting Driver,Waiting a while, the driver is comming<br>
            <a target="_blank" href="http://localhost:8080/WebApplication/pages/chat.jsp?target=CS-100000067">Chat with Lim Sai Keat</a><br>
            Note to driver: Driver</p>
    </li>
    <li><a href="#" class="pull-right">September 29 06:16 AM</a>From Location: <a target="_blank" href="https://maps.google.com/?q=3.1310516,101.7543801">Jalan Pandan Indah 4/3a, Pandan Indah, 55100 Kuala...</a><br>
        To Location: <a target="_blank" href="https://maps.google.com/?q=3.208393,101.756372">Kemensah Heights, 68000 Selangor</a>:
        <br>
        <p>Booking id: <a href="#">#1000000040</a><br>
            Driver: Otto Ledrane [d-oledrane1c]
            <br>
            Status: Aready pickup,You aready in pickup by the driver<br>
            <a target="_blank" href="http://localhost:8080/WebApplication/pages/chat.jsp?target=CS-100000040">Chat with Otto Ledrane</a><br>
            Note to driver: </p>
    </li>
    <li><a href="#" class="pull-right">August 28 10:46 AM</a>From Location: <a target="_blank" href="https://maps.google.com/?q=3.208393,101.756372">Kemensah Heights, 68000 Selangor</a><br>
        To Location: <a target="_blank" href="https://maps.google.com/?q=3.0899397,101.7418844">Leisure Mall, 8, Jalan Manis 2, Taman Segar, 56100...</a>:
        <br>
        <p>Booking id: <a href="#">#1000000039</a><br>
            Driver: Aigneis Turban [d-aturban1a]
            <br>
            Status: Booking Completed,Thank for your bookihn and payment<br>
            <a target="_blank" href="http://localhost:8080/WebApplication/pages/chat.jsp?target=CS-100000039">Chat with Aigneis Turban</a><br>
            Note to driver: </p>
    </li>
    <li><a href="#" class="pull-right">August 15 03:39 AM</a>From Location: <a target="_blank" href="https://maps.google.com/?q=3.134338499999999,101.6863371">Kuala Lumpur Sentral, 50470 Kuala Lumpur, Federal ...</a><br>
        To Location: <a target="_blank" href="https://maps.google.com/?q=3.208393,101.756372">Kemensah Heights, 68000 Selangor</a>:
        <br>
        <p>Booking id: <a href="#">#1000000030</a><br>
            Driver: Ariella Cremen [d-acremen15]
            <br>
            Status: Booking Completed,Thank for your bookihn and payment<br>
            <a target="_blank" href="http://localhost:8080/WebApplication/pages/chat.jsp?target=CS-100000030">Chat with Ariella Cremen</a><br>
            Note to driver: </p>
    </li>
    <li><a href="#" class="pull-right">July 31 03:28 AM</a>From Location: <a target="_blank" href="https://maps.google.com/?q=3.1278871,101.5944885">Section 19, 47410 Petaling Jaya, Selangor</a><br>
        To Location: <a target="_blank" href="https://maps.google.com/?q=3.208393,101.756372">Kemensah Heights, 68000 Selangor</a>:
        <br>
        <p>Booking id: <a href="#">#1000000019</a><br>
            Driver: Lim Sai Keat [d-saikeat9]
            <br>
            Status: Booking Completed,Thank for your bookihn and payment<br>
            <a target="_blank" href="http://localhost:8080/WebApplication/pages/chat.jsp?target=CS-100000019">Chat with Lim Sai Keat</a><br>
            Note to driver: </p>
    </li>
</ul>
