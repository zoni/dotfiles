import dracula
dracula.apply(c)

config.load_autoconfig()

config.bind('<Ctrl-f>', 'spawn --detach firefox {url} ;; tab-close')
config.set('tabs.mode_on_change', "persist")
config.set('tabs.show', 'multiple')
