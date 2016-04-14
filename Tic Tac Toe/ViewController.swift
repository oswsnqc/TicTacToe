//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by Yisen on 6/16/15.
//  Copyright (c) 2015 Yisen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // 1 = noughts, 2 = crosses
    
    
    var activePlayer = 1
    var gameactive = true
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    
    var winningcombinations = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
    
    @IBAction func playagain(sender: AnyObject) {
        activePlayer = 1
        gameactive = true
        gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        
        var button : UIButton
        
        for var i = 0;  i < 9; i++ {
            button = view.viewWithTag(i) as! UIButton
            button.setImage(nil, forState: .Normal)
        }
        
        winMessage.hidden = true
        playAgainButton.hidden = true
        
        winMessage.center = CGPoint(x: winMessage.center.x - 400, y: winMessage.center.y)
        playAgainButton.center = CGPoint(x: playAgainButton.center.x - 400, y: playAgainButton.center.y)

        
        
    }
    
    @IBOutlet weak var playAgainButton: UIButton!
    @IBOutlet weak var winMessage: UILabel!
    @IBOutlet weak var button: UIButton!
    @IBAction func buttonpressed(sender: AnyObject) {
        
        if gameState[sender.tag] == 0 && gameactive == true {
            var image = UIImage()
            gameState[sender.tag] = activePlayer
        
            if activePlayer == 1 {
                image = UIImage(named: "black-nought-hi.png")!
                activePlayer = 2
            } else {
                image = UIImage(named: "crosses.png")!
                activePlayer = 1
            }
            sender.setImage(image, forState: .Normal)

            
            for combinations in winningcombinations {
            
            if gameState[combinations[0]] != 0 && gameState[combinations[0]] == gameState[combinations[1]] && gameState[combinations[1]] == gameState[combinations[2]] {
                
                if gameState[combinations[0]] == 1 {
                    winMessage.text = "圈赢了！"
                    
                }   else {
                    winMessage.text = "叉赢了！"
                }
                
                
                winMessage.hidden = false
                playAgainButton.hidden = false

                
                UIView.animateWithDuration(0.5, animations: { () -> Void in
                    self.winMessage.center = CGPoint(x: self.winMessage.center.x + 400, y: self.winMessage.center.y)
                    self.playAgainButton.center = CGPoint(x: self.playAgainButton.center.x + 400, y: self.playAgainButton.center.y)
                })
                gameactive = false
            }
                
            }
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        winMessage.hidden = true
        playAgainButton.hidden = true
        
        winMessage.center = CGPoint(x: winMessage.center.x - 400, y: winMessage.center.y)
        playAgainButton.center = CGPoint(x: playAgainButton.center.x - 400, y: playAgainButton.center.y)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLayoutSubviews() {
       
        
    }


}

