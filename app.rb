# app.rb
require 'sinatra'
require 'json'
require 'net/http'
require 'uri'
require 'tempfile'
require 'line/bot'

def client
  @client ||= Line::Bot::Client.new do |config|
    config.channel_secret = ENV['LINE_CHANNEL_SECRET']
    config.channel_token = ENV['LINE_ACCESS_TOKEN']
  end
end

def bot_answer_to(a_question)
  case a_question
  when "weather"
    "2: Sweltering heat
    It's so hot and humid that some players collapse from heat exhaustion. Roll a D6 for each player on the pitch at the end of a drive. On a roll of 1 the player collapses and may not be set up for the next kick-off.
    3: Very sunny
    A glorious day, but the blinding sunshine causes a -1 modifier on all passing rolls.
    4-10: Perfect Conditions
    Neither too cold nor too hot. A warm, dry and slightly overcast day provides perfect conditions to Blood Bowl.
    11: Pouring rain
    It's raining, making the ball slippery and difficult to hold. A -1 modifier applies to all catch, intercept, or pick-up rolls.
    12: Blizzard
    It's cold and snowing! The ice on the pitch means that any player attempting to move an extra square (GFI) will slip and be Knocked Down on a roll of 1-2, while the snow means that only quick or short passes can be attempted."
  when"spring"
    "2: Morning Dew
    The pitch is dew-covered from the cold of night, making everything a little slippery. Apply a -1 modifier every time a player attempts to Rush an extra square. Additionally, apply a -1 modifier every time a player makes an Agility test to pick up the ball.
    3: Blossoming Flowers
    The flowers are blooming, the tree sap is pumping and the pollen count is high, forcing the hay fever-afflicted referee to seek shelter indoors. Whilst this weather condition is in effect, players cannot be Sent-off for committing a Foul, even if they roll a natural double on either the Armour roll or the Injury roll.
    4-10: Perfect Conditions
    It's not quite warm but then again, it's not quite cold - ideal weather for a game of Blood Bowl!
    11: Misty Morning
    A haze of thick mist has descended upon the pitch, greatly reducing visibility. Players can move only a maximum of six squares, although they may still Rush as normal. Additionally, only Quick and Short pass actions can be performed
    12: High Winds
    The winds are whistling through the stadium and the players can barely hear each other. Roll a D6 each time a player on your team wishes to use a team re-roll. On a roll of 2+, you may use a team re-roll as normal. On a 1, a team re-roll cannot be used."
  when "summer"
    "2: Sweltering Heat
    Some players faint in the unbearable heat! D3 randomly selected players from each team that are on the pitch when a drive ends are placed in the Reserves box. They must miss the next drive.
    3: Melting Astrogranite
    It's not just the players that are affected by the hot weather - even the pitch is melting! It might be the heat, or it might be the sticky footing, but the players are certainly struggling to move! The number of squares a player can attempt to Rush is reduced by one (to a minimum of one).
    4-10: Perfect Conditions
    It's still hot, but not as hot as it has been lately! A (tolerably) warm, dry and slightly overcast day provides perfect conditions for Blood Bowl.
    11: Blinding Rays
    No cloud cover in the clear, blue skies and the relentless glare of the sun leaves the players squinting and shading their eyes. Apply a -1 modifier every time a player tests against their Passing Ability. Additionally, only Quick and Short pass actions can be performed.
    12: Monsoon
    A sudden burst of torrential rain and high winds hits the pitch, making the ball slippery and erratic. Apply a -1 modifier every time a player makes an Agility test to catch or pick up the ball, or to attempt to interfere with a pass. Additionally, when the ball scatters, it moves from the square in which it was placed four times before landing, rather than the usual three."
  when "autumn"
    "2: Leaf-strewn Pitch
    Huge drifts of leaves have piled up at regular intervals across the pitch. It looks terrible, but they're soft to land on! When a player Falls Over or is Knocked Down, the coach of the opposing team must apply a -1 modifier when making an Armour roll against them.
    3: Autumnal Chill
    Winter is fast approaching and players are reluctant to leave the comfortable warmth of the dugout. During the End of Drive sequence, apply a -1 modifier when rolling to see if a player recovers from being KO'd.
    4-10: Perfect Conditions
    It's not quite warm, but then again it's not quite cold - ideal Blood Bowl weather! A pleasant autumn afternoon provides perfect conditions for Blood Bowl.
    11: Pouring Rain
    A torrential downpour leaves the players soaked and the ball very slippery! Apply a -1 modifier every time a player makes an Agility test to catch or pick up the ball, or to attempt to interfere with a pass.
    12: Strong Winds
    If it wasn't for the winds, it would be a lovely day. The ball does not deviate normally. Instead, after placing the kick, the coach of the kicking team rolls a D8 to determine the direction in which the wind is blowing: D8 - WIND DIRECTION 1-2 Towards the kicking team's End Zone. 3-4 Towards the receiving team's End Zone. 5-6 Towards the Sideline to the left of the kicking team. 7-8 Towards the Sideline to the right of the kicking team. Next, place the Throw-in template over the square in which the kick was placed, with the central arrow (3-4) pointing in the direction in which the wind is blowing. The kick then deviates in a direction determined by rolling a D6 and referring to the Throw-in template. Additionally, the number of squares the ball moves is determined by rolling a D8, rather than a D6."
  when "winter"
    "2: Cold Winds
    The fans are shivering in the stands as a viciously cold wind blows steadily down the pitch. Apply a -1 modifier every time a player tests against their Passing Ability. Players also find it harder to get motivated and get back on the pitch. Additionally, during Step 2 of the End of Drive sequence, apply a -1 modifier when rolling to see if any player in the Knockedout box recovers.
    3: Freezing
    A sudden cold snap turns the ground as hard as granite (and not the 'astro' variety that players are used to). When a player Falls Over or is Knocked Down, the coach of the opposing team must apply a +1 modifier when making an Armour roll against them.
    4-10: Perfect Conditions
    It's rather chilly and it's threatening to rain (or snow), but considering the time of year, the conditions are almost perfect for Blood Bowl.
    11: Heavy Snow
    Freezing conditions and heavy falls of snow make the footing treacherous. Apply a -1 modifier every time a player attempts to Rush an extra square. Additionally, the poor visibility means that only Quick and Short passes can be attempted.
    12: Blizzard
    Freezing conditions and heavy falls of snow make the footing treacherous. Apply a -1 modifier every time a player attempts to Rush an extra square. Additionally, the poor visibility means that only Quick and Short passes can be attempted."
  when "kickoff"
    "2: **Get The Ref!**
    Each Team gets a free bribe Inducement as described on page 91. This Inducement must be used before the end of the game or it is lost.
    3: **Time-Out**
    If the kicking team's turn marker is on turn 6, 7 or 8 for the half, both coaches move their turn marker back one space. Otherwise, both coaches move their turn marker forward one space.
    4: **Solid Defense**
    D3+3 Open players on the kicking team may be removed and setup again in different locations, following all of the usual set-up rules.
    5: **High Kick**
    One open player on the receiving team may be moved any number of squares, regardless of their MA, and placed in the same square the ball will land in.
    6: **Cheering Fans**
    Both Coaches roll a D6 and add the number of cheerleaders on their Team Draft list. The coach with the highest total may immediately roll once on the Prayers of Nuffle table, in the case of a tie, neither coach rolls on the Prayers of Nuffle table. Note that if you roll a result that is currently in effect, you must re-roll it. However, if you roll a result that has been rolled previously but has since expired, there is no need to re-roll.
    7: **Brilliant Coaching**
    Both coaches roll a D6 and add the number of assistant coaches on their Team Draft list. The coach with the highest total gains one extra team re-roll for the drive ahead. If this team re-roll is not used before the end of this drive, it is lost. In the case of a tie, neither coach gains an extra re-roll.
    8: **Changing Weather**
    Make a new roll on the Weather table and apply result. If the weather conditions are \'Perfect Conditions\' as a result of this roll, the ball will scatter, as described on page 25, before landing.
    9: **Quick Snap**
    D3+3 Open players on the receiving team may immediately move one square in any direction.
    10: **Blitz**
    D3+3 Open players on the kicking team may immediately activate to perform a Move action. One may perform a Blitz action and one may perform a Throw Team-mate action. If a player Falls over or is Knocked Down, no further players can be activated and the Blitz ends immediately.
    11: **Officious Ref**
    Both coaches roll a D6 and add their Fan Factor to the result. The coach that rolls the lowest randomly selects one of their players from among those on the pitch, in the case of a tie, both coaches randomly select a player. Roll a D6 for the selected player(s), On a roll of 2+, the player and the referee argue and come to blows, The player is Placed Prone and becomes Stunned. On a roll of 1 however, the player is immediately Sent-Off.
    12: **Pitch Invasion**
    Both coaches roll a D6 and add their Fan Factor to the result. The coach that rolls the lowest randomly selects D3 of their players from among those on the pitch, in the case of a tie, both coaches randomly select D3 players from among those on the pitch. Roll a D6 for the selected player(s), All of the randomly selected players are placed prone and become stunned."
  when "prayers"
    "1: **Treacherous Trapdoor**
    Until the end of the half, any player who lands on a Trapdoor rolls 1D6. On 1, he is considered pushed into the Public. If he was carrying the ball, it bounce
    2: **Friends with the Ref**
    Until the end of the Phase, argue results are treated as 2-4 and 5-6 instead of 2-5 and 6.
    3: **Stiletto**
    Randomly select one player on your team that is available to play during this drive and that does not have the Loner (X+) trait. Until the end of this drive, that player gains the Stab trait.
    4: **Iron Man**
    Choose one player on your team that is available to play during this drive and that does not have the Loner (X+) trait. Until the end of this game, that player improves their AV by 1, to a maximum of 11+.
    5: **Knuckle Dusters**
    Choose one player on your team that is available to play during this drive and that does not have the Loner (X+) trait. Until the end of this drive, that player gains the Mighty Blow (+1) skill.
    6: **Bad Habits**
    Randomly select D3 opposition players that are available to play during this drive and do not have the Loner (X+) trait. Until the end of this drive, those players gain the Loner (2+) trait.
    7: **Greasy Cleats**
    Randomly select one opposition player that is available to play during this drive. That player has had their boots tampered with! until the end of this drive, their MA is reduced by 1.
    8: **Blessed Statue of Nuffle**
    Choose one player on your team that is available to play during this drive and that does not have the Loner (X+) trait. Until the end of this game, that player gains the Pro skill.
    9: **Moles under the Pitch**
    Until the end of this half, apply a -1 modifier every time any player attempts to Rush an extra square (-2 should it occour that both coaches have rolled this result).
    10: **Perfect Passing**
    Until the end of this game, any player on your team that makes a completion earns 2 SPP, rather than the usual 1 SPP.
    11: **Fan Interaction**
    Until the end of this drive, if a player on your team causes a Casualty by pushing an opponent into the crowd, that player will earn 2 SPP exactly as if they had caused a Casualty by performing a Block action.
    12: **Necessary Violence**
    Until the end of this drive, any player on your team that causes a Casualty earns 3 SPP, rather than the usual 2 SPP.
    13: **Fouling Frenzy**
    Until the end of this drive, any player on your team that causes a Casualty with a Foul action earns 2 SPP exaclty as if they had caused a Casualty by performing a Block action.
    14: **Throw a Rock**
    Until the end of this drive, should an opposition player Stall, at the end of their team turn you may roll a D6. On a roll of 5+, an angry fan throws a rock at that player. The player is immediately Knocked Down.
    15: **Under Scrutiny**
    Until the end of this half, any player on the opposing team that commits a Foul action is automatically seen by the referee, even if a natural double is not rolled.
    16: **Intensive Training**
    Randomly select one player on your team that is available to play during this drive and that does not have the Loner (X+) trait. Until the end of this game, that player gains a Single Primary skill of choice."
  else
    "Please just say Spring, Summer, Autumn, Winter, or Weather. Or kickoff. Or prayers"
  end
end

def send_bot_message(message, client, event)
  # Log prints for debugging
  p 'Bot message sent!'
  p event['replyToken']
  p client

  message = { type: 'text', text: message }
  p message

  client.reply_message(event['replyToken'], message)
  'OK'
end

get '/' do
  "Chelmsford City for the Chaos Cup"
end

post '/callback' do
  body = request.body.read

  signature = request.env['HTTP_X_LINE_SIGNATURE']
  unless client.validate_signature(body, signature)
    error 400 do 'Bad Request' end
  end

  events = client.parse_events_from(body)
  events.each do |event|
    p event
    # Focus on the message events (including text, image, emoji, vocal.. messages)
    next if event.class != Line::Bot::Event::Message

    case event.type
    # when receive a text message
    when Line::Bot::Event::MessageType::Text
      user_id = event['source']['userId']
      response = client.get_profile(user_id)
      if response.class == Net::HTTPOK
        contact = JSON.parse(response.body)
        p contact
      else
        # Can't retrieve the contact info
        p "#{response.code} #{response.body}"
      end

      if event.message['text'].downcase == 'hello, world'
        # Sending a message when LINE tries to verify the webhook
        send_bot_message(
          'Everything is working!',
          client,
          event
        )
      else
        # The answer mechanism is here!
        send_bot_message(
          bot_answer_to(event.message['text'].downcase),
          client,
          event
        )
      end
    end
  end
  'OK'
end
