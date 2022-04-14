import weechat

weechat.register("shrug", "karx", "22.04", "Unlicense", "Send a shrug emote", "", "")
weechat.hook_command("shrug", "do shrug", "/shrug [msg]", "optional message", "", "do_shrug", "")

def do_shrug(data, buffer, args):
    if args == "":
        weechat.command(buffer, "¯\_(ツ)_/¯")
    else:
        weechat.command(buffer, f"{args} ¯\_(ツ)_/¯")
    return weechat.WEECHAT_RC_OK
