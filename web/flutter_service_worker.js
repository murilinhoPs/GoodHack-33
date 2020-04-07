'use strict';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "/assets/LICENSE": "4515c33aabe5143fad574be2e4f581f3",
"/assets/assets/info.png": "34c73405f210e45c6050966c5e1a9749",
"/assets/assets/logo.png": "c3c66cc1a78f6a62b3c89b6600f0053c",
"/assets/fonts/MaterialIcons-Regular.ttf": "56d3ffdef7a25659eab6a68a3fbfaf16",
"/assets/AssetManifest.json": "e43755584569aec8a8ebab6841b8ccd7",
"/assets/FontManifest.json": "ed9cd32fa597ae46abed4ac894b9902b",
"/icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"/icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"/favicon.png": "5dcef449791fa27946b3d35ad8803796",
"/index.html": "0f972f9a2567cb77ce1e06904cb68c40",
"/main.dart.js": "1966ff5e9cac2731427e52159e43c070",
"/manifest.json": "b8fa7d4c6d37cc2582915600b8bbd3a6"
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
