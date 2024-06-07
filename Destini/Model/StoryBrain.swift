//
//  StoryBrain.swift
//  Destini
//
//  Created by Sergey Zakurakin on 07/06/2024.
//

import Foundation

struct StoryBrain {
    
    var storyNumber = 0
    
    let stories = [
        Story(
            title: "Your car has blown a tire on a winding road in the middle of nowhere with no cell phone reception. You decide to hitchhike. A rusty pickup truck rumbles to a stop next to you. A man with a wide brimmed hat with soulless eyes opens the passenger door for you and asks: 'Need a ride, boy?'.",
            choiceOne: "I'll hop in. Thanks for the help!",
            choice1Destination: 2,
            choiceTwo: "Better ask him if he's a murderer first.",
            choice2Destination: 1
        ),
        Story(
            title: "He nods slowly, unfazed by the question.",
            choiceOne: "At least he's honest. I'll climb in.", choice1Destination: 2,
            choiceTwo: "Wait, I know how to change a tire.", choice2Destination: 3
        ),
        Story(
            title: "As you begin to drive, the stranger starts talking about his relationship with his mother. He gets angrier and angrier by the minute. He asks you to open the glovebox. Inside you find a bloody knife, two severed fingers, and a cassette tape of Elton John. He reaches for the glove box.",
            choiceOne: "I love Elton John! Hand him the cassette tape.", choice1Destination: 5,
            choiceTwo: "It's him or me! You take the knife and stab him.", choice2Destination: 4
        ),
        Story(
            title: "What? Such a cop out! Did you know traffic accidents are the second leading cause of accidental death for most adult age groups?",
            choiceOne: "The",
            choice1Destination: 0,
            choiceTwo: "End",
            choice2Destination: 0
        ),
        Story(
            title: "As you smash through the guardrail and careen towards the jagged rocks below you reflect on the dubious wisdom of stabbing someone while they are driving a car you are in.",
            choiceOne: "The", choice1Destination: 0,
            choiceTwo: "End", choice2Destination: 0
        ),
        Story(
            title: "You bond with the murderer while crooning verses of 'Can you feel the love tonight'. He drops you off at the next town. Before you go he asks you if you know any good places to dump bodies. You reply: 'Try the pier.'",
            choiceOne: "The", choice1Destination: 0,
            choiceTwo: "End", choice2Destination: 0
        )
    ]
    
    func getStory() -> String {
        stories[storyNumber].title
    }
    
    func getChoiceOne() -> String {
        stories[storyNumber].choiceOne
    }
    
    func getChoiceTwo() -> String {
        stories[storyNumber].choiceTwo
    }
    

    
    mutating func nextStory(userChoice: String) {
        
        let currentStory = stories[storyNumber]
        
        if userChoice == currentStory.choiceOne {
            storyNumber = currentStory.choice1Destination
        } else if userChoice == currentStory.choiceTwo {
            storyNumber = currentStory.choice2Destination
        }
    }
}
