#!/usr/bin/env python3

import sys
from jinja2 import Environment, FileSystemLoader


def create_puml(resource_name: str, sprite_text: str):
    env = Environment(
        loader=FileSystemLoader("./template"),
    )
    template = env.get_template("sprite_template.jinja")
    print(
        template.render(
            sprite_definition=sprite_text,
            resource_name=resource_name.upper(),
            sprite_name=resource_name,
        ),
    )


def read_pipe_input() -> str:
    lines = sys.stdin.readlines()
    return "".join(lines)


if __name__ == "__main__":
    sprite_text = read_pipe_input()
    create_puml(sys.argv[1], sprite_text)
