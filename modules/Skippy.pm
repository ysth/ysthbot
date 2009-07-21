package Bot::BasicBot::Pluggable::Module::Skippy;
use Bot::BasicBot::Pluggable::Module::Base;
use base qw(Bot::BasicBot::Pluggable::Module::Base);

=head1 NAME

Bot::BasicBot::Pluggable::Module::Skippy

=head1 SYNOPSIS

Helpful suggestions from skippy's list

=head1 IRC USAGE

skippy

=cut

my @list = split /^/,
q{1. Not allowed to watch Southpark when I'm supposed to be working.
2. My proper military title is "Specialist Schwarz" not "Princess Anastasia".
3. Not allowed to threaten anyone with black magic.
4. Not allowed to challenge anyone's disbelief of black magic by asking for hair.
5. Not allowed to get silicone breast implants.
6. Not allowed to play "Pulp Fiction" with a suction-cup dart pistol and any officer.
7. Not allowed to add "In accordance with the prophesy" to the end of answers I give to a question an officer asks me.
8. Not allowed to add pictures of officers I don't like to War Criminal posters.
9. Not allowed to title any product "Get Over it".
10. Not allowed to purchase anyone's soul on government time.
11. Not allowed to join the Communist Party.
12. Not allowed to join any militia.
13. Not allowed to form any militia.
14. Not allowed out of my office when the president visited Sarajevo.
15. Not allowed to train adopted stray dogs to "Sic Brass!"
16. Must get a haircut even if it tampers with my "Samson like powers".
17. God may not contradict any of my orders.
18. May no longer perform my now (in)famous "Barbie Girl Dance" while on duty.
19. May not call any officers immoral, untrustworthy, lying, slime, even if I'm right.
20. Must not taunt the French any more.
21. Must attempt to not antagonize SAS.
22. Must never call an SAS a "Wanker".
23. Must never ask anyone who outranks me if they've been smoking crack.
24. Must not tell any officer that I am smarter than they are, especially if it's true.
25. Never confuse a Dutch soldier for a French one.
26. Never tell a German soldier that "We kicked your ass in World War 2!"
27. Don't tell Princess Di jokes in front of the paras (British Airborne).
28. Don't take the batteries out of the other soldiers alarm clocks (Even if they do hit snooze about forty times).
29. The Irish MPs are not after "Me frosted lucky charms".
30. Not allowed to wake an Non-Commissioned Officer by repeatedly banging on the head with a bag of trash.
31. Not allowed to let sock puppets take responsibility for any of my actions.
32. Not allowed to let sock puppets take command of my post.
33. Not allowed to chew gum at formation, unless I brought enough for everybody.
34. Not allowed to chew gum at formation, unless I brought enough for everybody.  (Next day) Not allowed to chew gum at formation even if I *did* bring enough for everybody.
35. Not allowed to sing "High Speed Dirt" by Megadeth during airborne operations. ("See the earth below/Soon to make a crater/Blue sky, black death, I'm off to meet my maker")
36. Can't have flashbacks to wars I was not in. (The Spanish-American War isn't over).
37. Our medic is called "Sgt Larwasa", not "Dr. Feelgood".
38. Our supply Sgt is "Sgt Watkins" not "Sugar Daddy".
39. Not allowed to ask for the day off due to religious purposes, on the basis that the world is going to end, more than once.
40. I do not have super-powers.
41. "Keep on Trucking" is *not* a psychological warfare message.
42. Not allowed to attempt to appeal to mankind's baser instincts in recruitment posters.
43. Camouflage body paint is not a uniform.
44. I am not the atheist chaplain.
45. I am not allowed to "Go to Bragg boulevard and shake daddy's little money maker for twenties stuffed into my undies".
46. I am not authorized to fire officers.
47. I am not a citizen of Texas, and those other, forty-nine, lesser states.
48. I may not use public masturbation as a tool to demonstrate a flaw in a command decision.
49. Not allowed to trade military equipment for "magic beans".
50. Not allowed to sell magic beans during duty hours.
51. Not allowed to quote "Dr Seuss" on military operations.
52. Not allowed to yell "Take that Cobra" at the rifle range.
53. Not allowed to quote "Full Metal Jacket " at the rifle range.
54. "Napalm sticks to kids" is *not* a motivational phrase.
55. An order to "Put Kiwi on my boots" does *not* involve fruit.
56. An order to "Make my Boots black and shiny" does not involve electrical tape.
57. The proper response to a lawful order is not "Why?"
58. The following words and phrases may not be used in a cadence- Budding sexuality, necrophilia, I hate everyone in this formation and wish they were dead, sexual lubrication, black earth mother, all Marines are latent homosexuals, Tantric yoga, Gotterdammerung, Korean hooker, Eskimo Nell, we've all got jackboots now, slut puppy, or any references to squid.
59. May not make posters depicting the leadership failings of my chain of command.
60. "The Giant Space Ants" are not at the top of my chain of command.
61. If one soldier has a 2nd Lt bar on his uniform, and I have an E-4 on mine, it means he outranks me. It does not mean "I have been promoted three more times than you".
62. "It is better to beg forgiveness than to ask permission" no longer applies to Specialist Schwarz.
63. Command decisions do *not* need to be ratified by a 2/3 majority.
64. Inflatable novelties do *not* entitle me to BAQ or Separation pay.
65. There are no evil clowns living under my bed.
66. There is no "Anti-Mime" campaign in Bosnia.
67. I am not the Psychological Warfare Mascot.
68. I may not line my helmet with tin foil to "Block out the space mind control lasers".
69. May not pretend to be a fascist stormtrooper, while on duty.
70. I am not authorized to prescribe any form of medication.
71. I must not flaunt my deviances in front of my chain of command.
72. May not wear gimp mask while on duty.
73. No military functions are to be performed "Skyclad".
74. Woad is not camouflage makeup.
75. May not conduct psychological experiments on my chain of command.
76. "Teddy Bear, Teddy bear, turn around" is *not* a cadence.
77. The MP checkpoint is not an Imperial Stormtrooper roadblock, so I should not tell them "You don't need to see my identification, these are not the droids you are looking for."
78. I may not call block my chain of command.
79. I am neither the king nor queen of cheese.
80. Not allowed to wear a dress to any army functions.
81. May not bring a drag queen to the battalion formal dance.
82. May not form any press gangs.
83. Must not start any SITREP (Situation Report) with "I recently had an experience I just had to write you about...."
84. Must not use military vehicles to "Squish" things.
85. Not allowed to make any Psychological Warfare products depicting the infamous Ft. Bragg sniper incident.
86. May not challenge anyone in my chain of command to the "field of honor".
87. If the thought of something makes me giggle for longer than 15 seconds, I am to assume that I am not allowed to do it.
88. Must not refer to 1st Sgt as "Mom".
89. Must not refer to the Commander as "Dad".
90. Inflatable sheep do *not* need to be displayed during a room inspection.
91. I am not authorized to initiate Jihad.
92. When asked to give a few words at a military ceremony "Romper Bomper Stomper Boo" is probably not appropriate.
93. Nerve gas is not funny.
94. Crucifixes do not ward off officers, and I should not test that.
95. I am not in need of a more suitable host body.
96. "Redneck Zombies" is not a military training aid.
97. Gozer does not dwell in my refrigerator.
98. The proper response to a chemical weapon attack is not "Tell my chain of command what I really think about them, and then poke holes in their masks."
99. A smiley face is not used to mark a minefield.
100. Claymore mines are not filled with yummy candy, and it is wrong to tell new soldiers that they are.
101. I am not allowed to mount a bayonet on a crew-served weapon.
102. Rodents are not entitled to burial with full military honors, even if they are "casualties of war".
103. My commander is not old enough to have fought in the civil war, and I should stop implying that he did.
104. Vodka, green food coloring, and a "Cool Mint" Listerine(R) bottle is not a good combination.
105. I am not allowed to bum cigarettes off of anyone under twelve.
106. I may not trade my rifle for any of the following: Cigarettes, booze, sexual favors, Kalishnikovs, Soviet Armored vehicles, small children, or bootleg CD's.
107. Must not mock command decisions in front of the press.
108. Should not taunt members of the press, even if they are really fat, exceptionally stupid, and working for UPI.
109. I am not authorized to change national policy in Eastern Europe.
110. Never, ever, attempt to correct a Green Beret officer about anything.
111. I am not qualified to operate any US, German, Polish, or Russian Armored vehicles.
112. When saluting a "leg" officer, an appropriate greeting is not "Airborne leads the wa- oh...sorry sir".
113. There is absolutely no need to emulate the people from "Full Monty" every time I hear the song "Hot Stuff".
114. I cannot trade my CO to the Russians.
115. I should not speculate on the penis size of anyone who outranks me.
116. Crucifying mice - bad idea.
117. Must not use government equipment to bootleg pornography.
118. Burn pits for classified material are not revel fires - therefore it is wrong to dance naked around them.
119. I cannot arrest children for being rude.
120. An EO briefing is probably not the best place to unveil my newest off color joke.
121. I should not use government resources to "waterproof" dirty magazines.
122. Radioactive material should not be stored in the barracks.
123. I should not teach other soldiers to say offensive and crude things in Albanian, under the guise of teaching them how to say potentially useful phrases.
124. Two drink limit does not mean first and last.
125. Two drink limit does not mean two kinds of drinks.
126. Two drink limit does not mean the drinks can be as large as I like.
127. "No Drinking Of Alcoholic Beverages" does not imply that a Jack Daniel's (R) IV is acceptable.
128. "Shpadoinkle" is not a real word.
129. The Microsoft (R) "Dancing Paperclip" is not authorized to countermand any orders.
130. "I'm drunk" is a bad answer to any question posed by my commander.
131. No dancing in the turret. This especially applies in conjunction with rule #113.
132. The loudspeaker system is not a forum to voice my ideas.
133. The loudspeaker system is not to be used to replace the radio.
134. The loudspeaker system is not to be used to broadcast the soundtrack to a porno movie.
135. An order to put polish on my boots means the whole boot.
136. Shouting "Let's do the village! Let's do the whole fucking village!" while out on a mission is bad.
137. Should not show up at the front gate wearing part of a Russian uniform, messily drunk.
138. Even if my commander did it.
139. Must not teach interpreters how to make "MRE" bombs.
140. I am not authorized to sell mineral rights.
141. Not allowed to use a broadsword to disprove "The Pen is Mightier than the sword".
142. "Calvin-Ball" is not authorized PT.
143. I do not need to keep a "range card" by my window.
144. "K-Pot, LBE, and a thin coat of Break-free" is not an authorized uniform.
145. I should not drink three quarts of blue food coloring before a urine test.
146. Nor should I drink three quarts of red food coloring, and scream during the same.
147. I should not threaten suicide with pop rocks and Coke (R).
148. Putting red "Mike and Ike's" (R) into a prescription medicine bottle, and then eating them all in a formation is not funny.
149. Must not create new DOD forms, then insist they be filled out.
150. On Sports Day PT, a wedgie is not considered a legal tackle.
151. The proper way to report to my Commander is "Specialist Schwarz, reporting as ordered, Sir" not "You can't prove a thing!"
152. The following items do not exist: Keys to the Drop Zone, A box of grid squares, blinker fluid, winter air for tires, canopy lights, or Chem-Light (R) batteries.
153. I should not assign new privates to "guard the flight line".
154. Shouldn't treat "piss-bottles" with extra-strength icy hot.
155. Teaching Albanian children to taunt other soldiers is not nice.
156. I will no longer perform "lap-dances" while in uniform.
157. I will no longer perform "lap-dances" while in uniform.  If I take the uniform off, in the course of the lap-dance, it still counts.
158. The revolution is not now.
159. When detained by MP's, I do not have a right to a strip search.
160. No part of the military uniform is edible.
161. Bodychecking General officers is not a good idea.
162. Past lives have absolutely no effect on the chain of command.
163. Take that hat off.
164. There is no such thing as a were-virgin.
165. I do not get "that time of month".
166. No, the pants are not optional.
167. Not allowed to operate a business out of the barracks.
168. Not allowed to operate a business out of the barracks.  Especially not a pornographic movie studio.
169. Not allowed to operate a business out of the barracks.  Especially not a pornographic movie studio.  Not even if they *are* "especially patriotic films"
170. Not allowed to "defect" to OPFOR during training missions.
171. On training missions, try not to shoot down the General's helicopter.
172. "A full magazine and some privacy" is not the way to help a potential suicide.
173. I am not allowed to create new levels of security clearance.
174. Furby (R) is not allowed into classified areas. (I swear to the gods, I did not make that up, it's actually DOD policy).
175. We do not "charge into battle, naked, like the Celts".
176. Any device that can crawl across the table on medium, does not need to be brought into the office.
177. I am not to refer to a formation as "the boxy rectangle thingie".
178. I am not "A lesbian trapped in a man's body".
179. On Army documents, my race is not "Other".
180. On Army documents, my race is not "Other".  Nor is it "Secretariat, in the third".
181. Pokemon(R) trainer is not an MOS.
182. There is no FM for "wall-to-wall counseling".
183. My chain of command has neither the time, nor the inclination to hear about what I did with six boxes of Fruit Roll-Ups. (R)
184. When operating a military vehicle I may *not* attempt something "I saw in a cartoon".
185. My name is not a killing word.
186. I am not the Emperor of anything.
187. Must not taunt officers in the throes of nicotine withdrawal, with cigarettes.
188. May not challenge officers to "Meet me on the field of honor, at dawn".
189. Do not dare SERE graduates to eat bugs. They will always do it.
190. Must not make s'mores while on guard duty.
191. Our Humvees cannot be assembled into a giant battle-robot.
192. The proper response to a briefing is not "That's what you think".
193. The Masons, and Gray Aliens are not in our chain of command.
194. Shouldn't take incriminating photos of my chain of command.
195. Shouldn't use Photoshop (R) to create incriminating photos of my chain of command.
196. I am not allowed to give tattoos.
197. I am not allowed to sing "Henry the VIII I am" until verse 68 ever again.
198. Not allowed to lead a "Coup" during training missions.
199. I should not confess to crimes that took place before I was born.
200. My chain of command is not interested in why I "just happen" to have a kilt, an inflatable sheep, and a box of rubber bands in the back of my car.
201. Must not valiantly push officers onto hand grenades to save the squad.
202. Despite the confusing similarity in the names, the "Safety Dance" and the "Safety Briefing" are never to be combined.
203. "To conquer the earth with an army of flying monkeys" is a bad long term goal to give the re-enlistment NCO.
204. NEVER nail a stuffed bunny to a cross and put it up in front of the Battalion Headquarters sign as an "Easter Desecration."
205. Don't write up false gigs on a HMMWV PMCS. ("Broken clutch pedal", "Number three turbine has frequent flame-outs", "flux capacitor emits loud whine when engaged")
206. Not allowed to get shot.
207. The Chicken and Rice MRE is *not* a personal lubricant. (Skippy wanted this noted for the record that this is not something he has ever attempted or considered! It was something we heard at dinner on 22 September 2001 and it was just so obscene it had to go here.)
208. Not allowed to play into the deluded fantasies of the civilians who are "hearing conversations" from the NSA, FBI, CIA and KGB due to the microchip the aliens implanted in their brain.
209. An airsickness bag is to be used for airsickness *only*. (Also not a Skippy-ism...this was the same dinner.)
210. Must not make T-shirts up depicting a pig with the writing "Eat Pork or Die" in Arabic to bring as civilian attire when preparing to deploy to a primarily Muslim country.
211. Don't ask LTC Steele to sign my copy of Blackhawk Down.
212. Must not go on nine deployments in six years that require a security clearance that I don't have, even if the Army tells me repeatedly that I have one and I have no reason to question them.
213. Do not convince NCO's that their razorbumps are the result of microscopic parasites.};

sub help {
    return "Skippy's list:  skippy [ keyword | number ]";
}

sub said {
    my ($self, $mess, $pri) = @_;
    my @match;

    return unless ($pri == 0); # respond to everything mentioned.
    return unless $mess->{body} =~ /\bskippy'?s? ?(?:list)?\b\s*(\w*)/i;
    my $keyword = "\L$1";

    if ( $keyword =~ /^\d+\z/ ) {
        $reply = $list[$keyword-1];
    } elsif ($keyword && (@match = grep 0<=index(lc $_, $keyword), @list)) {
        $reply = $match[rand @match];
    } else {
        $reply = $list[rand @list];
    }

    $self->reply($mess, "http://skippyslist.com/list $reply");
    return 0;
}

*emoted = \&said;

1;
