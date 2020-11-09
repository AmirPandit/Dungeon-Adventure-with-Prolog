:-dynamic userAnswer/1,currentLocation/1, inventory/1,hasObject/2.

/* define the connection between the different locations */

connected("forest of giants",[location(east,maze),location(south,dungeon)]).
connected(dungeon,[location(north,"forest of giants"),location(south,"final boss room"),location(east,forest)]).
connected("final boss room",[location(north,dungeon)]).
connected(forest,[location(west,dungeon),location(south,temple),location(east,village)]).
connected(temple,[location(north,forest)]).
connected(maze,[location(south,village),location(west,"forest of giants"),location(east,lake)]).
connected(village,[location(north,maze),location(south,"mage place"),location(east,"mountain of despair"),location(west,forest)]).
connected("mage place",[location(north,village),location(east,"castle of drangleic"),location(south,underworld)]).
connected(underworld,[location(north,"mage place")]).
connected(lake,[location(west,maze)]).
connected("mountain of despair",[location(west,village)]).
connected("castle of drangleic",[location(west,"mage place")]).

/* define the connection between the main locations and sublocations */

hasPlace(temple,["treasure room"]).
hasPlace(village,[house,guild]).
hasPlace(underworld,["reaper room"]).
hasPlace(lake,["water hole"]).
hasPlace("mountain of despair",[hut]).
hasPlace("castle of drangleic",[cave]).

/*define the connections between the mail locations and the characters */

hasChar(forest,"wise man").
hasChar("mage place",mage).

/*define the connections between the places and objects*/

hasObject("forest of giants",["phoenix egg","key of earth"]).
hasObject(maze,["flower of life"]).
hasObject(house,["egyptian sword"]).
hasObject("treasure room",["egyptian treasure"]).
hasObject(guild,[warriors]).
hasObject(hut,["sword of souls","sun symbol"]).
hasObject("castle of drangleic",[armor,"moon symbol"]).
hasObject("reaper room",["flames of regret"]).
hasObject("water hole",["key of water","sword of ice and fire"]).
hasObject(cave,["key of wind"]).
hasObject(underworld,["key of fire"]).


/* define requirements to enter a specific room */
require("forest of giants",[warriors]):-!.
require("final boss room",["key of fire","key of water","key of earth","key of wind",armor,"sword of ice and fire"]):-!.
require(temple,["egyptian sword"]):-!.
require(maze,["lantern of truth"]):-!.
require("castle of drangleic",["mage permission"]):-!.
require(underworld,["mage permission","sword of souls"]):-!.
require(lake,["sun symbol","moon symbol","magic stick","flames of regret"]):-!.


require(_,[]).




/* describe environment */
description(dungeon):-
    nl,
    write("it's dark a cold fire, there is no one here ").

description("forest of giants"):-
    nl,
   write("the place is full of giants status and bodies, it's not a place you can survive it alone"),nl,
   write("with the help of the other warriors, you were able to defeat the giant creature that lives in this forest").



description(forest):-
    nl,
            write("it is  nice and quiet but be aware of it's not always as it looks like").

description(temple):-
    nl,
           write("you're inside an Egyptian temple"),nl,
           write("thanks to the **Egyptian sword** you were able to defeat Egyptian boss that protects this temple.").


description("treasure room"):-
    nl,
           write("there is a treasure in the middle of the room").


description(village):-
    nl,
           write("a casual village with few citizens").



description(maze):-
    nl,
           write("you can't find your way without the lantern of truth").

description("mage place"):-
           write("a quiet place with a lot of magic power around").


description(underworld):-
    nl,
           write("you can see souls and hear their screams of regret"),
           write("Cerberus attacked you from no where ..."),
           nl,
           write("you were able to kill him using the power of sword of souls").


description(lake):-
    nl,
           write("you can see a huge lake in front of you"),nl,
           write("the monster protecting this place attacked you"),
           nl,
           write("you burnt him using the flames of regret you got from the underworld"),
           nl,
           write("you used the power of the magic stick,moon symbol and sun symbol to evaporate the lake").


description("mountain of despair"):-
    nl,
          write("welcome to mountain of despair you can see death  bodies and skillets be carefull or you end like them").



description("castle of drangleic"):-
    nl,
         write("a good place to get an armor...").



description(house):-
    nl,
    write("pretty old house from the midlle ages").

description(guild):-
    nl,
    write("this is a place where warriors come to train, you might find someone to accompany you").


description(hut):-
    nl,
    write("such a miserable place, negative energy is everywhere, don't stay here long or ...").

description(cave):-
    nl,
    write("a pretty cold cave, you can hear the drop of water a powerfull wind is coming from the inside").

description("water hole"):-
    write("you can't see much").

description("reaper room"):-
    write("flames are every where around ...").




description("final boss room"):-
    nl,
    write("the boss attacked  you but your armor is solid enough to protect you"),
    nl,
    write("using the sword of ice and fire you killed the final boss"),
    nl,
    write("a secret door opened you can see the one piece"),
    nl,
    write("one piece is the treasure that can give you all what you need"),
    nl,
    write("power,glory and fortune"),
    nl,
    write("***********************end**********************"),
    !.

/* define characters requirements */
charRequire("wise man",["egyptian treasure"]).
charRequire(mage,["flower of life","phoenix egg"]).


charGive("wise man",["lantern of truth"]).
charGive(mage,["mage permission","magic stick"]).




/* define interaction with game characters */
talkTo("wise man"):-
  currentLocation(_current),
  hasChar(_current,"wise man"),
  write_ln("Hello warrior, you're at the beginning of a long journey"),
  write_ln("I have a mission for you,"),
  write_ln("bring the hidden treasure inside the old temple and I'll give you the   **lantern of truth**"),
  write_ln("you will need it for the rest of the journey").



talkTo(mage):-
  currentLocation(_current),
  hasChar(_current,mage),
  write_ln("we can talk after you bring me the ** phoenix egg , flower of life **"),
  write_ln("try to check the maze and the forest of giants if you didn't yet").

talkTo(_):-
    write("who are you talking too !!!").


give(_char,_objects):-
    currentLocation(_current),
    hasChar(_current,_char),
    charRequire(_char,_requirement),
    subset(_objects,_requirement),
    inventory(_collected),
    subset(_objects,_collected),
    subtract(_collected,_objects,_newInventory),
    charGive(_char,_gives),
    append(_newInventory,_gives,_newInventory2),
    retract(inventory(_collected)),
    asserta(inventory(_newInventory2)),
    write("Great job warrior, I give you"),
    write_ln(_gives),
    write_ln("check you inventory"),
    !.

give(_,_):-
     write_ln("warrior!! what are you trying to do").








/* define characters requirements */




/* define movement */

/*initial position when the game start*/

currentLocation(dungeon).


enter(_place):-
  currentLocation(_current),
  hasPlace(_current,_places),
  member(_place,_places),
  retract(currentLocation(_current)),
  assert(currentLocation(_place)),
  look,!.

enter(_):-
    currentLocation(_current),
    write("the is no such place in the "),
    write_ln(_current).


exit:-
    currentLocation(_place),
    hasPlace(_current,_places),
    member(_place,_places),
    retract(currentLocation(_place)),
    assert(currentLocation(_current)),
    write("you have exit from the "),
    write_ln(_place).


north:- move(north).
south:-move(south).
east:-move(east).
west:- move(west).

move(_direction):-
    currentLocation(_current),
    connected(_current,_locations),
    member(location(_direction,_destination),_locations),
    haveRequirement(_destination),
    retract(currentLocation(_current)),
    assert(currentLocation(_destination)),
    look,
    !.



move(_):-
    write("closed path !").


haveRequirement(_destination):-
    inventory(_collected),
    require(_destination,_requirements),
    subset(_requirements,_collected),!.

haveRequirement(_destination):-
    require(_destination,_requirements),
    write_ln("warrior, you aren't ready for this yet ..."),
    write_ln("you need :"),
    listRequirements(_requirements),
    fail.


/* explore envirement */
look:-
    userAnswer(yes),
    currentLocation(_current),
    write("you're in the "),write(_current),
    description(_current),
    nl,
    connected(_current,_locations),
    getDirections(_locations),
    nl,
    listPlaces(_current),
    listChars(_current),
    listObjects(_current),
    !.
look:-
    currentLocation(_current),
    listPlaces(_current),
    listChars(_current),
    listObjects(_current),
    !.

getDirection(location(_direction,_)):-
    write("there is a path to :"),
    write(_direction),
    nl,!.



getDirections([]).
getDirections([_location|_rest]):-
    getDirection(_location),
    getDirections(_rest).



listChars(_current):-
    hasChar(_current,_char),
    write("you can see :"),
    write_ln(_char),
    fail.
listChars(_).





listPlaces(_current):-
  hasPlace(_current,_places),
  listPlaces(_places),
  !.

listPlaces([]).
listPlaces([_place|_rest]):-
    write("you can see :"),
    write_ln(_place),
    listPlaces(_rest).

listPlaces(_).


listObjects(_current):-
    hasObject(_current,_objects),
    listObjects(_objects),
    !.

listObjects([]).
listObjects([_object|_rest]):-
    write("you can see :"),
    write_ln(_object),
    listObjects(_rest).

listObjects(_).


listRequirements([]).
listRequirements([H|Tail]):-
    tab(2),
    write("* "),
    write_ln(H),
    listRequirements(Tail).



/* interact with other objects */

inventory([]).

inventory:-
   inventory(_collected),
   listInventory(_collected).

listInventory([]):-!.
listInventory([_object1|Tail]):-
     tab(2),
     write("- "),
     write_ln(_object1),
     listInventory(Tail),
     !.




pick(_object):-
    currentLocation(_current),
    hasObject(_current,_objects),
    member(_object,_objects),
    delete(_objects,_object,_rest),
    retract(hasObject(_current,_objects)),
    asserta(hasObject(_current,_rest)),
    inventory(_collected),
    append([_object],_collected,_newInventory),
    retract(inventory(_collected)),
    assert(inventory(_newInventory)).


pick(_):-
    write_ln("what are you trying to pick !!!").


pickAll:-
    currentLocation(_current),
    hasObject(_current,_objects),
    retract(hasObject(_current,_objects)),
    inventory(_collected),
    append(_objects,_collected,_newInventory),
    retract(inventory(_collected)),
    asserta(inventory(_newInventory)),
    !.

pickAll.


drop(_object):-
    currentLocation(_current),
    inventory(_collected),
    member(_object,_collected),
    delete(_collected,_object,_newInventory),
    hasObject(_current,_objects),
    append([_object],_objects,_newObjects),
    retract(hasObject(_current,_objects)),
    asserta(hasObject(_current,_newObjects)),
    retract(inventory(_collected)),
    asserta(inventory(_newInventory)),
    !.
drop(_object):-
     currentLocation(_current),
     inventory(_collected),
     member(_object,_collected),
     delete(_collected,_object,_newInventory),
     asserta(hasObject(_current,[_object])),
     retract(inventory(_collected)),
     asserta(inventory(_newInventory)),
     !.

drop(_):-
    write_ln("what are you trying to drop !!!").



/* game entry */
start:-
    nl,
    write("Hello warrior, welcome to the dungeon,"),nl,
    write("you came here looking after power, glory, and fortune."),nl,
    write("You're standing in front of the dungeon guardian"),nl,
    write("he will ask you a question,"),nl,
    write("you have to solve the next enigma in order to start your journey."),nl,
    write("if you respond wrongly you'll be killed by the guardian"),nl,
    write("do you want to accept ? (yes/no)"),nl,
    read(_decision),
    acceptFirstExam(_decision),
    look.


userAnswer(no).

acceptFirstExam(yes):-
    nl,
    write_ln("you're a courageous warrior, this is you're enigma :"),
    write_ln("who is the human greatest enemy ?"),
    read(_answer),
    firstExamAnswer(_answer).
acceptFirstExam(_):-
    nl,
     write_ln("you're not qualified to get this journey .come back when you get strong"),nl.

firstExamAnswer(himself):-
    nl,
    write_ln("Gongrats you've passed your first test"),
    write_ln("you can start your journey now good luck"),
    write_ln(", you will need it..."),nl,
    retract(userAnswer(no)),
    asserta(userAnswer(yes)).

firstExamAnswer(_):-
    nl,
    write_ln("you're not qualified to get this journey . I'll take your soul now . shine!!").








/* Instructions */

instructions:-
    write_ln("******************************************************"),
    write_ln("                    GAME INSTRUCTIONS                 "),
    write_ln("******************************************************"),

    tab(2),write("start"),tab(2),write_ln("used to start the game"),

    tab(2),write("look :"),tab(1),write_ln("used to look around the current place"),

    tab(2),write("inventory"),tab(2),write_ln("used to see inside you inventory"),

    tab(2),write("north :"),tab(1),write_ln("used to move north"),
    tab(2),write("east :"),tab(1),write_ln("used to move east"),
    tab(2),write("south :"),tab(1),write_ln("used to move south"),
    tab(2),write("west :"),tab(1),write_ln("use to move west"),

    tab(2),write("enter :"),tab(1),write_ln("used to enter closed location like : houses ..."),

    tab(2),write("exit :"),tab(1),write_ln("used to exit from closed place like: houses ..."),

    tab(2),write("pick(object_name) :"),tab(1),write_ln("used to pick a single object from current location if any"),

    tab(2),write("pickAll :"),tab(1),write_ln("used to pick All existing object in the current location"),

    tab(2),write("drop(object_name) :"),tab(1),write_ln("used to drop the object from the inventory if it exist"),

    tab(2),write("talkTo(character_name) :"),tab(1),write_ln("used to talk to a specific character inside the game"),

    tab(2),write("give(character_name,[list of objects]) :"),tab(1),write_ln("used to give object collected from mission to a specific character in order to get rewards from him"),
      write_ln("******************************************************"),
      write_ln("                    SIDE NOTES                        "),
      write_ln("******************************************************"),

      tab(2),write_ln("if the name is composed use double quotes ("") to write it,otherwise you can ignore ("")"),


      write_ln("******************************************************").





