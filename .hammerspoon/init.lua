local function keyCode(key, modifiers)
   modifiers = modifiers or {}
   return function()
      hs.eventtap.event.newKeyEvent(modifiers, string.lower(key), true):post()
      hs.timer.usleep(1000)
      hs.eventtap.event.newKeyEvent(modifiers, string.lower(key), false):post()
   end
end

local function remapKey(modifiers, key, keyCode)
   hs.hotkey.bind(modifiers, key, keyCode, nil, keyCode)
end

local function disableAllHotkeys()
   for k, v in pairs(hs.hotkey.getHotkeys()) do
      v['_hk']:disable()
   end
end

local function enableAllHotkeys()
   for k, v in pairs(hs.hotkey.getHotkeys()) do
      v['_hk']:enable()
   end
end

local function handleGlobalAppEvent(name, event, app)
   if event == hs.application.watcher.activated then
      -- アプリの切り替えを監視して、対象が iTerm2 だったらキーリマップを無効にする
      if name ~= "iTerm2" then
         enableAllHotkeys()
      else
         disableAllHotkeys()
      end
   end
end

appsWatcher = hs.application.watcher.new(handleGlobalAppEvent)
appsWatcher:start()

-- カーソル移動
remapKey({'ctrl'}, 'f', keyCode('right'))
remapKey({'ctrl'}, 'b', keyCode('left'))
remapKey({'ctrl'}, 'n', keyCode('down'))
remapKey({'ctrl'}, 'p', keyCode('up'))

-- 削除
remapKey({'ctrl'}, 'h', keyCode('delete'))
remapKey({'ctrl'}, 'u', keyCode('delete', {'cmd'}))
remapKey({'ctrl'}, 'w', keyCode('delete', {'alt'}))

-- Ctrl-M でリターン
remapKey({'ctrl'}, 'm', keyCode('return'))
remapKey({'ctrl', 'cmd'}, 'm', keyCode('return', {'cmd'}))
remapKey({'ctrl', 'alt'}, 'm', keyCode('return', {'alt'}))
remapKey({'ctrl', 'shift'}, 'm', keyCode('return', {'shift'}))
remapKey({'cmd'}, 'm', keyCode('f20')) -- ⌘Mの誤打が多いので無効化する
