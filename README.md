# Aplicacion Rails con MaterialDesign, Twitter Widget, Google Maps Widget, WistiaVideos
:hp-tags: RubyOnRails, MaterialDesign, Twitter, GoogleMaps

* Comandos de inicio
* Instalacion de MaterialDesign
* Creacion de widget de Twitter
* Creacion de Key para GoogleMaps y uso

#### Comandos de inicio
 Para la creacion de la aplicacion:

 > rails new AplicacionPrueba

 Para la creacion de las paginas

 > rails g controller pages contact about

#### Instalacion de MaterialDesign

 Colocar en el **Gemfile** la gema:

 > gem 'materialize-sass'

 Cambiar el nombre al archivo **app/assets/stylesheets/application.css** por **app/assets/stylesheets/application.scss**
 y agregar la siguiente linea:

 > @import 'materialize';

 Colocar en el archivo **app/assets/javascripts/application.js** debajo de **//= require jquery_ujs** lo siguiente:

 > //= require materialize-sprockets

#### Creacion de widget twitter

 Ir a [**Twitter**](https://twitter.com) , Iniciar sesion en tu cuenta, darle click a tu imagen -> Configuracion

 En el menu lateral izquierdo dirigirse a la opcion Widgets, crear nuevo widget, copiar el codigo HTML que se encuentra debajo de la vista previa.

 Dentro de tu proyecto ubicarte en la vista donde quieres ver tu TL. En mi caso es en **app/views/pages/about.html.erb** y pegar el codigo HTML que habias copiado de la pagina de twitter y **WUALAAA** :boom: :sparkles:.

#### Creacion de Key para GoogleMaps y uso

 Para poder hacer uso de la API de GoogleMaps es necesario contar con una llave(KEY) para autrizar a nuestra pagina de su uso, para habilitar la API nos iremos a [**Consola de desarrollador de Google**](https://console.developer.google.com), Iniciaremos sesion con tu cuenta de google y nos ubicaremos en el Administrador de APIs. En las APIs de GoogleMaps seleccionaremos **Google Maps JavaScript API** y la habilitamos. En el menu lateral izquierdo seleccionamos **Credenciales**. Le damos **Añadir Credenciales -> Clave de API -> Clave de navegador** alli colocaremos la direccion URL en donde se ubicara el mapa. Copiamos la KEY generada.

 Nos dirigimos al archivo donde colocaremos nuestro mapa, en mi caso **app/views/pages/contact.html.erb** y colocaremos el siguiente codigo:

 ```HTML
 <div id="map"></div>
 <style media="screen">
   div#map{
     overflow: visible !important;
     width: 100%;
     height: 800px;
   }
 </style>
 <script>

 function initMap() {
   var myLatLng = {lat: 9.604714, lng: -69.235217};

   var map = new google.maps.Map(document.getElementById('map'), {
     zoom: 4,
     center: myLatLng
   });

   var marker = new google.maps.Marker({
     position: myLatLng,
     map: map,
     title: 'Hello World!'
   });
 }

     </script>
     <script async defer
         src="https://maps.googleapis.com/maps/api/js?key=LA-KEY-QUE-GENERASTE&signed_in=true&callback=initMap"></script>
```

Tienen que colocar en la ultima linea de codigo donde se hace el llamado a la API de maps la KEY que generaste anteriormente y **WUALAAAA** :boom: :sparkles:


#### Para correr el aplicativo
Para correr el aplicativo sin docker es necesario tener instalado ruby en tu coputador:

* Sin Docker:
  * bundle install
  * rake db:create && rake db:migrate
  * rails server

* Con Docker:
  * docker-compose up --build
