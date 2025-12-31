'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "65aa316f64723141599cee0531b90310",
"assets/AssetManifest.bin.json": "310c490485a296a2b51c90a9174c1549",
"assets/AssetManifest.json": "91621afafff82af940cd0b828649c515",
"assets/assets/fonts/Comfortaa-Medium.ttf": "1a7bfac2b8d70a2726a281786c3894cd",
"assets/assets/fonts/Comfortaa-Regular.ttf": "53f695dbfc6f703f86ed88bddde527b6",
"assets/assets/images/animated.png": "7758f11972095f3846c1022ea15c0b62",
"assets/assets/images/animated2.png": "3c81238640677140b7f54cd0088d0fad",
"assets/assets/images/animatedImage4.png": "473f5b71970c127c45135693a0e0fbf2",
"assets/assets/images/Clean_arch.jpg": "9fd23e886494e482253b6de2298ed865",
"assets/assets/images/craftscene_logo.png": "4ba54478e92f331ee768c7a8e00a0343",
"assets/assets/images/Dart.svg": "11b770f163584b0e8cbba1f7bc626f55",
"assets/assets/images/DEPI_Cert.jpg": "ae0b8c86c51c3b02d32d56bfcbbbcf89",
"assets/assets/images/firebase.svg": "1da8d950e3f30a69d7c957c26238e1de",
"assets/assets/images/flutter.svg": "5c3a6308a335872a831a9f836f0e236c",
"assets/assets/images/github-mark.svg": "8dcc6b5262f3b6138b1566b357ba89a9",
"assets/assets/images/GitHub.svg": "4b8a4845e3c03b05cc92e2b3199889d5",
"assets/assets/images/GitHubActions.svg": "889c4151482912e281c6c77fb0fefb91",
"assets/assets/images/google-cloud.svg": "5ba2fbc77cb6003084cb53c63a83ec6f",
"assets/assets/images/image-4775e472-ec59-4388-b070-6cd98c7ab97b.png": "2a99203dabe224946972e4270166ceae",
"assets/assets/images/Insomnia.svg": "272cadbae5230498f8146eeebe220c54",
"assets/assets/images/Java.svg": "459bbae2e96a2410c5b429eb941a4c11",
"assets/assets/images/PairExtraordinaire.png": "1caa0a7b33e1dae4fd409ae951da1d23",
"assets/assets/images/Postman.svg": "39894ce0d6c55afd644a854bff6b03b3",
"assets/assets/images/profile.png": "f496441b2e83dfdb88ab761b2568f08b",
"assets/assets/images/profile_pic1.png": "b3aad33d87a040fe09aa87745560a2e1",
"assets/assets/images/profile_pic2.png": "60bea3ea606a249dcfc6d353be4fab14",
"assets/assets/images/PullShark.png": "3cdd654138fa8034b143f0b7f4c9bcb7",
"assets/assets/images/QuickDraw_SkinTone1.png": "be104489212bc0efbce3043449565429",
"assets/assets/images/whatsapp.svg": "6af811ad106a7b93893299cffdc3792c",
"assets/assets/images/YOLO_Badge.png": "dbaeb78542b4795671ec1205748b09e1",
"assets/FontManifest.json": "21167d73c6af673929e4d313e86c58d7",
"assets/fonts/MaterialIcons-Regular.otf": "e9462235c764fb9976a003e362bdaef3",
"assets/NOTICES": "524e683a2c861d96c359e7200f4d9a1b",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "140ccb7d34d0a55065fbd422b843add6",
"canvaskit/canvaskit.js.symbols": "58832fbed59e00d2190aa295c4d70360",
"canvaskit/canvaskit.wasm": "07b9f5853202304d3b0749d9306573cc",
"canvaskit/chromium/canvaskit.js": "5e27aae346eee469027c80af0751d53d",
"canvaskit/chromium/canvaskit.js.symbols": "193deaca1a1424049326d4a91ad1d88d",
"canvaskit/chromium/canvaskit.wasm": "24c77e750a7fa6d474198905249ff506",
"canvaskit/skwasm.js": "1ef3ea3a0fec4569e5d531da25f34095",
"canvaskit/skwasm.js.symbols": "0088242d10d7e7d6d2649d1fe1bda7c1",
"canvaskit/skwasm.wasm": "264db41426307cfc7fa44b95a7772109",
"canvaskit/skwasm_heavy.js": "413f5b2b2d9345f37de148e2544f584f",
"canvaskit/skwasm_heavy.js.symbols": "3c01ec03b5de6d62c34e17014d1decd3",
"canvaskit/skwasm_heavy.wasm": "8034ad26ba2485dab2fd49bdd786837b",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "888483df48293866f9f41d3d9274a779",
"flutter_bootstrap.js": "97173ebb7570175fa7d0727b262c62f9",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "d23c17e5621d741eb9767097adf12956",
"/": "d23c17e5621d741eb9767097adf12956",
"main.dart.js": "0ee804689e3486184349862ad653cbf6",
"manifest.json": "e74af8957b5899dc6da961caee768ec9",
"version.json": "009c9e65172e010890f7f65fde438006"};
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
