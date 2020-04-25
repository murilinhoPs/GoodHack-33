'use strict';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "index.html": "7e0725cfcb802113cc53718ae27dddbe",
"/": "7e0725cfcb802113cc53718ae27dddbe",
"main.dart.js": "6fede389239dd06358627dcc54e4a14a",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "15e1406116125cf01a7e25307ef3d089",
"assets/LICENSE": "dbe9529f0ffaffd7355c0581367c13d4",
"assets/AssetManifest.json": "e43755584569aec8a8ebab6841b8ccd7",
"assets/FontManifest.json": "580ff1a5d08679ded8fcf5c6848cece7",
"assets/fonts/MaterialIcons-Regular.ttf": "56d3ffdef7a25659eab6a68a3fbfaf16",
"assets/assets/info.png": "34c73405f210e45c6050966c5e1a9749",
"assets/assets/logo.png": "c3c66cc1a78f6a62b3c89b6600f0053c"
};

self.addEventListener('activate', function (event) {
  event.waitUntil(
    caches.keys().then(function (cacheName) {
      return caches.delete(cacheName);
    }).then(function (_) {
      return caches.open(CACHE_NAME);
    }).then(function (cache) {
      return cache.addAll(Object.keys(RESOURCES));
    })
  );
});

self.addEventListener('fetch', function (event) {
  event.respondWith(
    caches.match(event.request)
      .then(function (response) {
        if (response) {
          return response;
        }
        return fetch(event.request);
      })
  );
});
