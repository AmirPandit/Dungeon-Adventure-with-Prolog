# DUNGEON ADVENTURE GAME
    <h1>Dungeon Adventure</h1>
    <p>Welcome to <strong>Dungeon Adventure</strong>! This is a text-based adventure game written in Prolog. In this game, you'll explore various mystical locations, interact with characters, collect objects, and uncover secrets on your quest for power, glory, and fortune.</p>
    <h2>Features</h2>
    <ul>
        <li><strong>Dynamic Locations</strong>: Navigate through diverse environments like forests, dungeons, villages, and more.</li>
        <li><strong>Interactive Characters</strong>: Meet characters who provide quests and rewards.</li>
        <li><strong>Inventory System</strong>: Collect and manage items you find throughout your adventure.</li>
        <li><strong>Object Interactions</strong>: Pick up, drop, and use items to solve puzzles and progress.</li>
        <li><strong>Boss Battles</strong>: Face off against challenging bosses with unique narratives.</li>
    </ul>
    <h2>Gameplay</h2>
    <ul>
        <li><strong>Movement</strong>: Move between locations using commands like <code>north</code>, <code>south</code>, <code>east</code>, and <code>west</code>.</li>
        <li><strong>Interaction</strong>: Talk to characters using <code>talkTo(CharacterName)</code>, and give items using <code>give(CharacterName, [Item1, Item2, ...])</code>.</li>
        <li><strong>Exploration</strong>: Look around using <code>look</code> to see your current environment and available directions.</li>
        <li><strong>Inventory</strong>: Manage your inventory with commands like <code>inventory</code>, <code>pick(Item)</code>, and <code>drop(Item)</code>.</li>
        <li><strong>Quest Completion</strong>: Follow narratives and complete tasks to progress through the game.</li>
<!--Commands for the game --!>
### Commands
        
    <h2>Getting Started</h2>
    <ol>
        <li><strong>Install SWI-Prolog</strong>: Ensure you have SWI-Prolog installed on your system. You can download it from <a href="https://www.swi-prolog.org/Download.html">SWI-Prolog's website</a>.</li>
        <li><strong>Run the Game</strong>: 
            <ul>
                <li>Save the Prolog code into a file named <code>dungeon_adventure.pl</code>.</li>
                <li>Open SWI-Prolog and load the file by typing <code>[dungeon_adventure].</code> at the Prolog prompt.</li>
                <li>Start the game by typing <code>start.</code></li>
            </ul>
        </li>
    </ol>
    <h2>Example</h2>
    <pre>
        ?- [dungeon_adventure].
        % dungeon_adventure.pl compiled 0.00 sec, 10,440 bytes
        true.
        ?- start.
        Hello warrior, welcome to the dungeon,
        you came here looking after power, glory, and fortune.
        You're standing in front of the dungeon guardian
        he will ask you a question,
        you have to solve the next enigma in order to start your journey.
        if you respond wrongly you'll be killed by the guardian
        do you want to accept ? (yes/no)
    </pre>
    <h2>Contributing</h2>
    <p>Feel free to contribute to the game by improving the code, adding new features, or fixing bugs. Pull requests are welcome!</p>
    <h2>License</h2>
    <p>This game is open source. You are free to modify and distribute it according to your needs.</p>
</body>
</html>
