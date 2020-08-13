<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    	<%String tlss=request.getParameter("tlss");%>
    	<%String recc=request.getParameter("recc");%>
<!DOCTYPE html>

<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

    <title>index</title>
    <meta name="description" content="" />
    <meta name="author" content="Christoph Oberhofer" />

    <meta name="viewport" content="width=device-width; initial-scale=1.0; user-scalable=no" />
    <link rel="stylesheet" type="text/css" href="css/styles.css" />

    
  </head>
      <script type="text/javascript" src="test.js" ></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 
<script type="text/javascript"> 
let constraintObj = { 
        audio: false, 
        video: { 
            facingMode: "user", 
            width: { min: 640, ideal: 1280, max: 1920 },
            height: { min: 480, ideal: 720, max: 1080 } 
        } 
    }; 
if (navigator.mediaDevices === undefined) {
    navigator.mediaDevices = {};
    navigator.mediaDevices.getUserMedia = function(constraintObj) {
        let getUserMedia = navigator.webkitGetUserMedia || navigator.mozGetUserMedia;
        if (!getUserMedia) {
            return Promise.reject(new Error('getUserMedia is not implemented in this browser'));
        }
        return new Promise(function(resolve, reject) {
            getUserMedia.call(navigator, constraintObj, resolve, reject);
        });
    }
}else{
    navigator.mediaDevices.enumerateDevices()
    .then(devices => {
        devices.forEach(device=>{
            console.log(device.kind.toUpperCase(), device.label);
            //, device.deviceId
        })
    })
    .catch(err=>{
        console.log(err.name, err.message);
    })
}
navigator.mediaDevices.getUserMedia(constraintObj)
.then(function(mediaStreamObj) {
    //connect the media stream to the first video element
    let video = document.querySelector('video');
    if ("srcObject" in video) {
        video.srcObject = mediaStreamObj;
    } else {
        //old version
        video.src = window.URL.createObjectURL(mediaStreamObj);
    }
    
    video.onloadedmetadata = function(ev) {
        //show in the video element what is being captured by the webcam
        video.play();
    };
});

 
</script>
  <script>	$(document).ready(function() {
	  var tlss="<%=tlss%>";
	  var ff=document.getElementById("tls");
	  
	  ff.value=tlss;
	  var recc="<%=recc%>";
	  var ff2=document.getElementById("rec");
	  
	  ff2.value=recc;

	});
  

</script><body>
<form action="outfordeliverytrack.jsp" method="post" id="ff">
    <section id="container" class="container">

      <div id="result_strip">
        <ul class="thumbnails"></ul>
        <ul class="collector"></ul>
      </div>
      <div id="interactive" class="viewport"></div>
      
    </section>
    <input type="text"  id="tls" name="tlss" hidden>
    <input type="text"  id="rec" name="recc" hidden>

        </form>
		     <!-- All JS Files -->
		    <!-- jQuery -->
		    <script src="js/jquery.min.js"></script>
		    <!-- Popper -->
		    <script src="js/popper.min.js"></script>
		    <!-- Bootstrap -->
		    <script src="js/bootstrap.min.js"></script>
		    <!-- All Plugins -->
		    <script src="js/delivery.bundle.js"></script>
		    <!-- Active -->
		    <script src="js/default-assets/active.js"></script>
		    	<!-- jQuery Scrollbar -->
	<script src="assets/js/plugin/jquery-scrollbar/jquery.scrollbar.min.js"></script>
	<!-- Datatables -->
	<script src="assets/js/plugin/datatables/datatables.min.js"></script>
 
		    	<!--   Core JS Files   -->
			<script src="assets/js/core/jquery.3.2.1.min.js"></script>
			<script src="assets/js/core/popper.min.js"></script>
			<script src="assets/js/core/bootstrap.min.js"></script>
			<!-- jQuery UI -->
			<script src="assets/js/plugin/jquery-ui-1.12.1.custom/jquery-ui.min.js"></script>
			<script src="assets/js/plugin/jquery-ui-touch-punch/jquery.ui.touch-punch.min.js"></script>
			<script type="text/javascript" src="test.js" ></script>
			<!-- jQuery Scrollbar -->
			<script src="assets/js/plugin/jquery-scrollbar/jquery.scrollbar.min.js"></script>
			<!-- Datatables -->
			<script src="assets/js/plugin/datatables/datatables.min.js"></script>
			 <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.min.js"></script>
			 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 
  
    <script src="quagga.min.js" type="text/javascript"></script>
    <script src="live_w_locator.js" type="text/javascript"></script>
  </body>
</html>
