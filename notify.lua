weechat.register('notify', 'Yash Karandikar', '22.05.10', 'Unlicense',
        'Notify on highlight', '', '')

weechat.hook_signal('weechat_highlight', 'notify', '')
weechat.hook_signal('irc_pv', 'notify', '')
function notify (data, signal, signal_data)
    nick, text = string.match(signal_data, '(.-)\t(.+)')
    os.execute('notify-send -i "/usr/share/icons/Papirus-Dark/128x128/apps/weechat.svg" '  .. string.format('%q %q', nick, text))
    return weechat.WEECHAT_RC_OK
end
