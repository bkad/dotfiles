-- Stick it in ~/Library/Application Support/iTerm/Scripts
-- or ~/Library/Application Support/iTerm2/AutoLaunch.scpt
tell application "iTerm"
  activate
  set appServer to (make new terminal)
  tell appServer
    launch session "Ngfront"
    tell the last session
      write text "z ngfront; clear; ./main.py --debug --no_cass"
    end tell

    launch session "Default Session"
    tell the last session
      write text "pkill varnishd; z ngfront; clear; ./varnish/run_varnish.sh"
    end tell

    select the first session
  end tell
  set the bounds of the first window to {0, 0, 1280, 705}
end tell

tell application "iTerm"
  activate
  set assetsCompiler to (make new terminal)
  tell assetsCompiler
    activate current session
    launch session "Default Session"
    tell the last session
      write text "z ngfront/static; grunt watch"
    end tell
  end tell
  set the bounds of the first window to {0, 705, 1280, 1440}
end tell

tell application "iTerm"
  activate
  set repoTerminal to (make new terminal)
  tell repoTerminal
    activate current session
    launch session "Ngfront"
    tell the last session
      write text "z ngfront; clear"
    end tell
  end tell
  set the bounds of the first window to {3840, 0, 5120, 705}
end tell
