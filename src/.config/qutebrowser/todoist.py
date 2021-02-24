import dracula
dracula.apply(c)

config.load_autoconfig()

config.bind('<Ctrl-f>', 'spawn --detach firefox {url} ;; spawn --detach todoist-toggle --hide ;; close')
config.bind('<Ctrl-f>', 'spawn --detach firefox {url} ;; spawn --detach todoist-toggle --hide ;; close', mode="passthrough")
config.bind('<Ctrl-h>', 'spawn todoist-toggle --hide')
config.bind('<Ctrl-h>', 'spawn todoist-toggle --hide', mode="passthrough")
config.bind('<Ctrl-h>', 'spawn todoist-toggle --hide', mode="insert")
config.bind('d', 'tab-close')

config.set('content.javascript.can_open_tabs_automatically', True)
config.set('content.notifications', True)
config.set('input.insert_mode.auto_leave', False)
config.set('input.insert_mode.leave_on_load', False)
config.set('tabs.mode_on_change', "persist")
config.set('tabs.show', 'multiple')
config.set('tabs.tabs_are_windows', True)
