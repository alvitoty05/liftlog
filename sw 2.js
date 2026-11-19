var V='liftlog-v13',SHELL=['./','index.html','sync-config.js','manifest.json','icon-192.png','icon-512.png','icon.svg'];
self.addEventListener('install',function(e){e.waitUntil(caches.open(V).then(function(c){return c.addAll(SHELL);}).then(function(){return self.skipWaiting();}));});
self.addEventListener('activate',function(e){e.waitUntil(caches.keys().then(function(k){return Promise.all(k.filter(function(n){return n!==V;}).map(function(n){return caches.delete(n);}));}).then(function(){return self.clients.claim();}));});
self.addEventListener('fetch',function(e){
  var r=e.request;if(r.method!=='GET')return;
  e.respondWith(fetch(r).then(function(res){
    if(res&&(res.ok||res.type==='opaque')){var cp=res.clone();caches.open(V).then(function(c){c.put(r,cp);});}
    return res;
  }).catch(function(){return caches.match(r).then(function(m){return m||caches.match('index.html');});}));
});
