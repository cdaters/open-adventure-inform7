[ Open Adventure Bear Subsystem ]

Section 1 - Parser Surface

Feeding is an action applying to one thing.
Understand "feed [something]" as feeding.

Freeing is an action applying to one thing.
Understand "free [something]" as freeing.
Understand "release [something]" as freeing.

Section 2 - Messages

To say openadventure bear feeding message:
	say "The bear eagerly wolfs down your food, after which he seems to calm down considerably and even becomes rather friendly."

To say openadventure bear hands message:
	say "With what?  Your bare hands?  Against *HIS* bear hands??"

To say openadventure bear confused message:
	say "The bear is confused; he only wants to be your friend."

To say openadventure already dead message:
	say "For crying out loud, the poor thing is already dead!"

To say openadventure bear chained message:
	say "The bear is still chained to the wall."

To say openadventure bear blocks message:
	say "There is no way to get past the bear to unlock the chain, which is probably just as well."

To say openadventure still locked message:
	say "The chain is still locked."

To say openadventure chain unlocked message:
	say "The chain is now unlocked."

To say openadventure chain locked message:
	say "The chain is now locked."

To say openadventure no locksite message:
	say "There is nothing here to which the chain can be locked."

To say openadventure bear follows message:
	say "OK, the bear's now following you around."

To say openadventure bear wanders message:
	say "The bear wanders away from you."

To say openadventure bear scares troll message:
	say "The bear lumbers toward the troll, who lets out a startled shriek and scurries away.  The bear soon gives up the pursuit and wanders back."

To say openadventure axe near bear message:
	say "The axe misses and lands near the bear where you can't get at it."

To say openadventure axe guarded by bear message:
	say "No chance.  It's lying beside the ferocious bear, quite within harm's way."

Section 3 - State Helpers

To initialize openadventure bear subsystem:
	enable subsystem bear;
	now openadventure-bear-is-following is false;
	now openadventure-bear-guards-axe is false;
	now openadventure-bear-last-event is "";
	if adventure-state of BEAR is "":
		now adventure-state of BEAR is "UNTAMED_BEAR";
	if adventure-state of CHAIN is "":
		now adventure-state of CHAIN is "CHAINING_BEAR";
	now BEAR is fixed in place;
	now CHAIN is fixed in place.

To decide whether openadventure bear is friendly:
	if adventure-state of BEAR is "SITTING_BEAR":
		decide yes;
	if adventure-state of BEAR is "CONTENTED_BEAR":
		decide yes;
	decide no.

To decide whether openadventure bear is tame and unchained:
	if adventure-state of BEAR is "CONTENTED_BEAR" and adventure-state of CHAIN is "CHAIN_HEAP":
		decide yes;
	decide no.

To decide whether openadventure troll is present for bear in (current-room - room):
	if adventure-state of TROLL is "TROLL_GONE":
		decide no;
	if current-room is LOC_SWCHASM:
		decide yes;
	if current-room is LOC_NECHASM:
		decide yes;
	if TROLL is in current-room:
		decide yes;
	decide no.

To openadventure bear chases troll from (current-room - room):
	now adventure-state of TROLL is "TROLL_GONE";
	move TROLL to LOC_NOWHERE;
	move TROLL2 to LOC_SWCHASM;
	now adventure-state of CHASM is "TROLL_BRIDGE";
	move BEAR to current-room;
	now openadventure-bear-is-following is false;
	now openadventure-bear-last-event is "troll_chased";
	say "[openadventure bear scares troll message]".

Section 4 - Bear Food and Combat

To feed openadventure bear:
	if adventure-state of BEAR is "BEAR_DEAD":
		say "[openadventure already dead message]";
		stop;
	if adventure-state of BEAR is "UNTAMED_BEAR":
		if FOOD is carried by the player or FOOD is in the location of the player:
			move FOOD to LOC_NOWHERE;
			now AXE is portable;
			now adventure-state of AXE is "AXE_HERE";
			now openadventure-bear-guards-axe is false;
			now adventure-state of BEAR is "SITTING_BEAR";
			now openadventure-bear-last-event is "fed";
			say "[openadventure bear feeding message]";
		otherwise:
			say "There is nothing here to eat.";
		stop;
	say "The bear doesn't seem very interested in your offer."

Instead of feeding BEAR:
	feed openadventure bear.

Instead of feeding FOOD:
	if BEAR is in the location of the player:
		feed openadventure bear;
	otherwise:
		say "There is nothing here to eat."

Instead of freeing BEAR:
	if BEAR is carried by the player or openadventure-bear-is-following is true:
		if openadventure troll is present for bear in the location of the player:
			openadventure bear chases troll from the location of the player;
		otherwise:
			move BEAR to the location of the player;
			now openadventure-bear-is-following is false;
			now openadventure-bear-last-event is "dropped";
			say "[openadventure bear wanders message]";
	otherwise:
		unlock openadventure bear chain.

Instead of freeing CHAIN:
	unlock openadventure bear chain.

Instead of giving FOOD to BEAR:
	feed openadventure bear.

Instead of throwing FOOD at BEAR:
	feed openadventure bear.

Instead of attacking BEAR:
	if adventure-state of BEAR is "BEAR_DEAD":
		say "[openadventure already dead message]";
	else if openadventure bear is friendly:
		say "[openadventure bear confused message]";
	otherwise:
		say "[openadventure bear hands message]".

Instead of throwing AXE at BEAR:
	if adventure-state of BEAR is "BEAR_DEAD":
		say "[openadventure already dead message]";
	else if openadventure bear is friendly:
		say "[openadventure bear confused message]";
	otherwise:
		move AXE to the location of the player;
		now AXE is fixed in place;
		now adventure-state of AXE is "AXE_LOST";
		now openadventure-bear-guards-axe is true;
		now openadventure-bear-last-event is "axe_lost";
		say "[openadventure axe near bear message]".

Instead of taking AXE when openadventure-bear-guards-axe is true:
	say "[openadventure axe guarded by bear message]".

Section 5 - Chain and Following

To unlock openadventure bear chain:
	if KEYS is not carried by the player and KEYS is not in the location of the player:
		say "You have no keys!";
		stop;
	if adventure-state of BEAR is "UNTAMED_BEAR":
		say "[openadventure bear blocks message]";
		stop;
	if adventure-state of CHAIN is "CHAIN_HEAP":
		say "It was already unlocked.";
		stop;
	now adventure-state of CHAIN is "CHAIN_HEAP";
	now CHAIN is portable;
	if adventure-state of BEAR is not "BEAR_DEAD":
		now adventure-state of BEAR is "CONTENTED_BEAR";
		now BEAR is portable;
	now openadventure-bear-last-event is "chain_unlocked";
	say "[openadventure chain unlocked message]".

To lock openadventure bear chain:
	if KEYS is not carried by the player and KEYS is not in the location of the player:
		say "You have no keys!";
		stop;
	if adventure-state of CHAIN is not "CHAIN_HEAP":
		say "It was already locked.";
		stop;
	if the location of the player is not LOC_BARRENROOM:
		say "[openadventure no locksite message]";
		stop;
	now adventure-state of CHAIN is "CHAIN_FIXED";
	if CHAIN is carried by the player:
		move CHAIN to the location of the player;
	now CHAIN is fixed in place;
	now openadventure-bear-last-event is "chain_locked";
	say "[openadventure chain locked message]".

Instead of opening CHAIN:
	unlock openadventure bear chain.

Instead of unlocking CHAIN with KEYS:
	unlock openadventure bear chain.

Instead of closing CHAIN:
	lock openadventure bear chain.

Instead of locking CHAIN with KEYS:
	lock openadventure bear chain.

Oaunlockingbearchain is an action applying to nothing.
Understand "unlock chain" as oaunlockingbearchain.
Understand "open chain" as oaunlockingbearchain.

Carry out oaunlockingbearchain:
	unlock openadventure bear chain.

Oalockingbearchain is an action applying to nothing.
Understand "lock chain" as oalockingbearchain.
Understand "close chain" as oalockingbearchain.

Carry out oalockingbearchain:
	lock openadventure bear chain.

Instead of taking CHAIN:
	if adventure-state of CHAIN is "CHAIN_HEAP":
		continue the action;
	if adventure-state of BEAR is not "UNTAMED_BEAR":
		say "[openadventure still locked message]";
	otherwise:
		say "Surely you're joking!"

Instead of taking BEAR:
	if adventure-state of BEAR is "BEAR_DEAD":
		say "[openadventure already dead message]";
	else if not openadventure bear is friendly:
		say "Surely you're joking!";
	else if adventure-state of CHAIN is not "CHAIN_HEAP":
		say "[openadventure bear chained message]";
	otherwise:
		now BEAR is portable;
		move BEAR to the player;
		now openadventure-bear-is-following is true;
		now openadventure-bear-last-event is "following";
		say "[openadventure bear follows message]".

Instead of dropping BEAR:
	if BEAR is not carried by the player:
		say "What?";
	else if openadventure troll is present for bear in the location of the player:
		openadventure bear chases troll from the location of the player;
	otherwise:
		move BEAR to the location of the player;
		now openadventure-bear-is-following is false;
		now openadventure-bear-last-event is "dropped";
		say "[openadventure bear wanders message]".

Section 6 - Runtime Hooks

To run openadventure bear post-travel hooks for destination (target - room):
	if BEAR is carried by the player:
		now openadventure-bear-is-following is true;
	else if openadventure-bear-is-following is true:
		move BEAR to target.

When play begins:
	initialize openadventure bear subsystem.
