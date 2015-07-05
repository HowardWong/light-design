<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>灯光展示</title>
    <meta name="viewport" content="width=device-width, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0">
    
    <script src="./assert/js/jquery-1.11.3.js"></script>
    <link rel="stylesheet" href="./assert/css/bootstrap.min.css" />
	<link rel="stylesheet" href="./assert/css/bootstrap-theme.min.css" >
	<link rel="stylesheet" href="./assert/css/bootstrap-switch.min.css" >
	<link rel="stylesheet" href="./assert/css/highlight.css" >
	<link rel="stylesheet" href="./assert/css/main.css" >
	<script src="./assert/js/bootstrap.min.js"></script>
	<script src="./assert/js/highlight.js"></script>
	<script src="./assert/js/main.js"></script>
	<script src="./assert/js/bootstrap-switch.min.js"></script>
	<script src="./change.js"></script>
	
	<!-- model -->
	<script src="./assert/model/sofa.js"></script>
	<script src="./assert/model/top.js"></script>
	
    <style>
      body {
        background-color: #000;
        margin: 0px;
        overflow: hidden;
      }
    </style>
  </head>
<body>
<jsp:include page="nav.jsp" flush="true"/>

    <div id="container"></div>
    <script src="./assert/js/three.min.js"></script>
    <script src="./assert/js/OrbitControls.js"></script>

    <script>
      // scene size
      var WIDTH = window.innerWidth;
      var HEIGHT = window.innerHeight;

      // camera
      var VIEW_ANGLE = 45;
      var ASPECT = WIDTH / HEIGHT;
      var NEAR = 1;
      var FAR = 1000;

      var camera, scene, renderer;

      var cameraControls;

      var verticalMirror, groundMirror;
      var sphereGroup, smallSphere;
      //light
      var mainLight;
      var stop = 0;
      var reflect;
      var position = Array();
      var spot = Array();
      var spotLight = Array();
	  var loader = new THREE.JSONLoader();
	  
 	position[0] = -150;
 	position[1] = 150;
 	position[2] = 0;
 	position[3] = 150;
 	position[4] = 150;
 	position[5] = 150;
 	position[6] = 150;
 	position[7] = 0;
 	position[8] = 150;
 	position[9] = -150;
 	position[10] = 0;
 	position[11] = -150;
 	position[12] = -150;
 	position[13] = -150;
 	position[14] = -150;
 	position[15] = 0;

    $(document).ready(function() {
      	loader.load("./assert/model/sofa.js", function (geometry, materials) {
		   	var sofa = new THREE.Mesh(geometry, new THREE.MeshFaceMaterial(materials));
		   	sofa.scale.set(0.1,0.1,0.1);
		   	sofa.rotateY( - Math.PI)
		    sofa.position.x = 0;
		    sofa.position.y = 0;
			sofa.position.z = 160;
		    sofa.castShadow = true;
		    sofa.receiveShadow = true;
		    scene.add(sofa);
		});	
      	loader.load("./assert/model/top.js", function (geometry, materials) {
		   	var Lamp = new THREE.Mesh(geometry, new THREE.MeshFaceMaterial(materials));
		   	Lamp.scale.set(0.1,0.1,0.1);
		   	Lamp.rotateY( - Math.PI)
		    Lamp.position.x = 0;
		    Lamp.position.y = 150;
			Lamp.position.z = 0;
		    Lamp.castShadow = true;
		    Lamp.receiveShadow = true;
		    scene.add(Lamp);
		});	
      	loader.load("./assert/model/shot.js", function (geometry, materials) {
      		for(var i=0; i<=7; i++) {
			   	spot[i] = new THREE.Mesh(geometry, new THREE.MeshFaceMaterial(materials));
			   	spot[i].scale.set(0.1,0.1,0.1);
			   	spot[i].rotateY( - Math.PI)
			    spot[i].position.x = position[2*i];
			    spot[i].position.y = 190;
				spot[i].position.z = position[2*i+1];
			    spot[i].castShadow = false;
			    spot[i].receiveShadow = false;
			    scene.add(spot[i]);
      		}

		});	
    	$("input[type='checkbox']").on('switchChange.bootstrapSwitch', function() {
    		var ipt = $(this);
   			setTimeout(function(){
   				$.change(ipt.attr("id"));
   			}, 500);
		});
        start();
    });
      function init() {
        // renderer
        renderer = new THREE.WebGLRenderer();
        renderer.setPixelRatio( window.devicePixelRatio );
        renderer.setSize( WIDTH, HEIGHT );

        // scene
        scene = new THREE.Scene();

        // camera
        camera = new THREE.PerspectiveCamera(VIEW_ANGLE, ASPECT, NEAR, FAR);
        camera.position.set( 0, 200, 200 );

        cameraControls = new THREE.OrbitControls(camera, renderer.domElement);
        cameraControls.target.set( 0, 100, 0);
        cameraControls.maxDistance = 600;
        cameraControls.minDistance = 10;
        cameraControls.update();

        var container = document.getElementById( 'container' );
        container.appendChild( renderer.domElement );

      }

      function fillScene() {

        /*var planeGeo = new THREE.PlaneBufferGeometry( 200, 200 );*/
        var side = new THREE.PlaneBufferGeometry( 401, 201 );
        var cover = new THREE.PlaneBufferGeometry( 401, 401 );
        
        // MIRROR planes
        
        // walls
        var left = THREE.ImageUtils.loadTexture('./pic/left.jpg', {}, function() {
            renderer.render(scene, camera);
        });

		var front = THREE.ImageUtils.loadTexture('./pic/front.jpg', {}, function() {
            renderer.render(scene, camera);
        });
        
        var back = THREE.ImageUtils.loadTexture('./pic/back.jpg', {}, function() {
            renderer.render(scene, camera);
        });
        
        var right = THREE.ImageUtils.loadTexture('./pic/right.jpg', {}, function() {
            renderer.render(scene, camera);
        });
        
        var buttom = THREE.ImageUtils.loadTexture('./pic/buttom.jpg', {}, function() {
            renderer.render(scene, camera);
        });
        
        var planeTop = new THREE.Mesh( cover, new THREE.MeshLambertMaterial( { color: 0xffffff } ) );
        planeTop.position.y = 200;
        planeTop.rotateX( Math.PI / 2 );
        scene.add( planeTop );

        var planeButtom = new THREE.Mesh( cover, new THREE.MeshLambertMaterial( { map:buttom } ) );
        planeButtom.position.y = 0;
        planeButtom.rotateX( -Math.PI / 2 );
        scene.add( planeButtom );

/*        var planeBack = new THREE.Mesh( planeGeo, new THREE.MeshPhongMaterial( { color: 0xff0000 } ) );
        planeBack.position.z = -200;
        planeBack.position.y = 100;
        scene.add( planeBack );*/


        var planeBack = new THREE.Mesh( side, new THREE.MeshLambertMaterial( { map:back } ) );
        planeBack.position.z = -200;
        planeBack.position.y = 100;
        scene.add( planeBack );

        var planeFront = new THREE.Mesh( side, new THREE.MeshLambertMaterial( { map:front } ) );
        planeFront.position.z = 200;
        planeFront.position.y = 100;
        planeFront.rotateY( Math.PI );
        scene.add( planeFront );
        
        var planeRight = new THREE.Mesh( side, new THREE.MeshLambertMaterial( { map:right } ) );
        planeRight.position.x = 200;
        planeRight.position.y = 100;
        planeRight.rotateY( - Math.PI / 2 );
        scene.add( planeRight );

        var planeLeft = new THREE.Mesh( side, new THREE.MeshLambertMaterial( { map:left } ) );
        planeLeft.position.x = -200;
        planeLeft.position.y = 100;
        planeLeft.rotateY( Math.PI / 2 );
        scene.add( planeLeft );
        
        // lights
        if(mainLight == undefined) {
            mainLight = new THREE.PointLight( 0xffffff, 1.2, 1500 );
            mainLight.castShadow = true;
            mainLight.position.x = 0;
            mainLight.position.y = 180;
            mainLight.position.z = 0;
        }
        scene.add(mainLight);
        
        reflect = new THREE.PointLight( 0xffffff,1, 2000 );
        reflect.castShadow = true;
        reflect.position.x = 0;
        reflect.position.y = 30;
        reflect.position.z = 0;
        scene.add(reflect);
        
      	for(var i=0; i<=7; i++) {
            spotLight[i] = new THREE.PointLight( 0xffffff, 0.3, 500 );
            spotLight[i].castShadow = true;
            spotLight[i].position.x = position[2*i];
            spotLight[i].position.y = 180;
            spotLight[i].position.z = position[2*i+1];
		    scene.add(spotLight[i]);
    	}
        
        
/*        var greenLight = new THREE.PointLight( 0x00ff00, 0.25, 1000 );
        greenLight.position.set( 550, 50, 0 );
        scene.add( greenLight );

        var redLight = new THREE.PointLight( 0xff0000, 0.25, 1000 );
        redLight.position.set( - 550, 50, 0 );
        scene.add( redLight );

        var blueLight = new THREE.PointLight( 0x7f7fff, 0.25, 1000 );
        blueLight.position.set( 0, 50, 550 );
        scene.add( blueLight ); */

      }

      function render() {
        if(stop == 0) {
            renderer.render(scene, camera);
        }else {
            return;
        }
      }

      function update() {
        if(stop == 0) {
            requestAnimationFrame( update );
            cameraControls.update();
            
            render();
        }else {
            return;
        }
      }
      function start() {
        init();
        fillScene();
        update();
      }


    </script>
  </body>
</html>
