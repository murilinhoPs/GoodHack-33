'use strict';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "/assets/LICENSE": "0a08b974e5da61ce06a4bd293f3ef916",
"/assets/assets/logo.svg": "da3fbb8a3fb776b80fdba0ee20167cc4",
"/assets/fonts/MaterialIcons-Regular.ttf": "56d3ffdef7a25659eab6a68a3fbfaf16",
"/assets/AssetManifest.json": "ab8c645c3d4e9f68487287fe1a816e2a",
"/assets/FontManifest.json": "ed9cd32fa597ae46abed4ac894b9902b",
"/icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"/icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"/favicon.png": "5dcef449791fa27946b3d35ad8803796",
"/index.html": "0f972f9a2567cb77ce1e06904cb68c40",
"/main.dart.js": "f785988c93ffb44df3a81742acb819df",
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
