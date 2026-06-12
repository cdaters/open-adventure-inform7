#!/usr/bin/env python3

from pathlib import Path
import yaml

from generators.rooms import generate_rooms
from generators.objects import generate_objects
from generators.travel import generate_travel
from generators.vocabulary import generate_vocabulary

SOURCE = Path("source/adventure.yaml")
GENERATED = Path("generated")

def main():

    with open(SOURCE, "r", encoding="utf-8") as f:
        data = yaml.safe_load(f)

    GENERATED.mkdir(exist_ok=True)

    rooms_file = GENERATED / "Rooms.ni"
    objects_file = GENERATED / "Objects.ni"
    travel_file = GENERATED / "Travel.ni"
    vocabulary_file = GENERATED / "Vocabulary.ni"

    rooms_file.write_text(
        generate_rooms(data),
        encoding="utf-8"
    ) 

    objects_file.write_text(
        generate_objects(data),
        encoding="utf-8"
    )

    travel_file.write_text(
        generate_travel(data),
        encoding="utf-8"
    )
    
    vocabulary_file.write_text(
        generate_vocabulary(data),
        encoding="utf-8"
    )

    print(f"Generated {objects_file}")
    print(f"Generated {rooms_file}")
    print(f"Generated {travel_file}")
    print(f"Generated {vocabulary_file}")

if __name__ == "__main__":
    main()
