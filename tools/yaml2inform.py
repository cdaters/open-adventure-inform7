#!/usr/bin/env python3

from pathlib import Path
import yaml

from generators.rooms import generate_rooms
from generators.travel import generate_travel

SOURCE = Path("source/adventure.yaml")
GENERATED = Path("generated")

def main():

    with open(SOURCE, "r", encoding="utf-8") as f:
        data = yaml.safe_load(f)

    GENERATED.mkdir(exist_ok=True)

    rooms_file = GENERATED / "Rooms.ni"
    travel_file = GENERATED / "Travel.ni"

    rooms_file.write_text(
        generate_rooms(data),
        encoding="utf-8"
    ) 

    travel_file.write_text(
        generate_travel(data),
        encoding="utf-8"
    )

    print(f"Generated {rooms_file}")
    print(f"Generated {travel_file}")

if name == "main":
    main()
