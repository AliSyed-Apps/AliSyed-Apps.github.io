'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter_bootstrap.js": "db4e14831b16c26a91900b26e4c8d247",
"version.json": "9b818ca9511483c901bed1545384376c",
"index.html": "6ddc6715fc03dac6e22446a18a3ab868",
"/": "6ddc6715fc03dac6e22446a18a3ab868",
"main.dart.js": "c0f4562e0cef425e3ea63e240d3a8396",
"flutter.js": "83d881c1dbb6d6bcd6b42e274605b69c",
"favicon.png": "4a4d8024683265a7b3cdfb93a71a5531",
"icons/Icon-192.png": "4a4d8024683265a7b3cdfb93a71a5531",
"icons/Icon-maskable-192.png": "4a4d8024683265a7b3cdfb93a71a5531",
"icons/Icon-maskable-512.png": "4a4d8024683265a7b3cdfb93a71a5531",
"icons/Icon-512.png": "4a4d8024683265a7b3cdfb93a71a5531",
"manifest.json": "e2b9103aaafaf8ed9f90576c9d9a1341",
"assets/AssetManifest.json": "fc3f97954929079fb954e0abf2b8e622",
"assets/NOTICES": "3bc6d77d8026995b1e2221b87ea90116",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/AssetManifest.bin.json": "f99265ab55fe473b1ad8467c4a80026d",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "825e75415ebd366b740bb49659d7a5c6",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin": "b5a17df606cfe29ad3fd3cab27f6b3e0",
"assets/fonts/MaterialIcons-Regular.otf": "20ea620beab7e643b47de87fc9a1a6e6",
"assets/assets/profile/logo-n1.png": "d0e661af0434cbb0739c949edca958c4",
"assets/assets/profile/logo-n2.png": "85a8dd29645f93d3bbcb54514ed16a43",
"assets/assets/profile/logo-n3.png": "7c2471a3b8e67d26e986660c3473c316",
"assets/assets/profile/fav.png": "4a4d8024683265a7b3cdfb93a71a5531",
"assets/assets/logo/nodejs.webp": "7b3208bd1acab5329762832dca26516e",
"assets/assets/logo/flutter.png": "e1dacf68c8e19e3d28ae7f678e75e7cc",
"assets/assets/logo/firebase.png": "9ed79d8d77f3aab27b935896f7258479",
"assets/assets/logo/py.png": "99c0ccdf675ccfc33f1258802c263524",
"assets/assets/logo/socket.png": "79b629a929c4ce2ffd15efafa6f7f579",
"assets/assets/logo/communication.png": "90ad4f3f066f2f990a5a76faa5d5c311",
"assets/assets/logo/api.png": "4cf36f4996d20dfd376de4342c061b4e",
"assets/assets/logo/php.png": "e58a370e5a7e783b1cf72a116f234b8f",
"assets/assets/logo/mongodb.png": "447b38ccaa71368017c64e615649cc34",
"assets/assets/banner/p6.jpeg": "4cf0f0ff0b45a609cfab80fa6435beb7",
"assets/assets/banner/techs.png": "b9839b1e78c2bbcca0c5de457e2a59e4",
"assets/assets/banner/p3.png": "3f9206628697eb1b9aa00c2d57930287",
"assets/assets/banner/project.png": "97ab6f3f41829828fa59ed60685e507f",
"assets/assets/banner/p2.png": "fb7d3b27157cd9afa6f3cf2927b8db57",
"assets/assets/banner/p1.png": "546ee393392523d2d2f3dfe49c9313c5",
"assets/assets/banner/p5.jpeg": "59e9a6551e51d912fd833c80af0b4070",
"assets/assets/banner/p4.jpeg": "3677879284e581ca5ae6dfa9d0a85f7a",
"canvaskit/skwasm.js": "ea559890a088fe28b4ddf70e17e60052",
"canvaskit/skwasm.js.symbols": "9fe690d47b904d72c7d020bd303adf16",
"canvaskit/canvaskit.js.symbols": "27361387bc24144b46a745f1afe92b50",
"canvaskit/skwasm.wasm": "1c93738510f202d9ff44d36a4760126b",
"canvaskit/chromium/canvaskit.js.symbols": "f7c5e5502d577306fb6d530b1864ff86",
"canvaskit/chromium/canvaskit.js": "8191e843020c832c9cf8852a4b909d4c",
"canvaskit/chromium/canvaskit.wasm": "c054c2c892172308ca5a0bd1d7a7754b",
"canvaskit/canvaskit.js": "728b2d477d9b8c14593d4f9b82b484f3",
"canvaskit/canvaskit.wasm": "a37f2b0af4995714de856e21e882325c"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
