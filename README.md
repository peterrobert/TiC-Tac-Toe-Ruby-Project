# Tic-Tac-Toe with Ruby

 > Building a tic-tac-toe game that can be played on the command line(windows) / terminal(mac &amp; linux) where two human players can play against each other and the board is displayed in between turns.

 > Full task description [here](https://www.theodinproject.com/courses/ruby-programming/lessons/oop)

## Built With

- Ruby 2.6.5
- VS Code

## How to Install

- Install Ruby in your system. To install Ruby, you can read the [Documentation](https://www.ruby-lang.org/en/documentation/installation/)
- Download it as a [Zip File](https://github.com/peterrobert/TiC-Tac-Toe-Ruby-Project/archive/fourth-milestone.zip). If you have installed Git in your system, you can clone it using **git clone** command.
- For Windows users, open Command Prompt and run:
    ```console
    C:\>cd Tic-Tac-Toe-folder
    C:\Tic-Tac-Toe-folder>ruby bin/main.rb
    ```
- For Linux and Mac users, open a Terminal and run:
    ```console
    $ cd Tic-Tac-Toe-folder
    $ ruby ./bin/main.rb
    ``` 
- Enjoy!

## How to Test the Methods In the Classes

 Install Rspec gem in your system. To do this:

 Open Command Prompt or Terminal and run:

    ```console
    gem install Rspec
    ```
 Navigate into the spec folder and run the following at the console:

   ```console
   rspec tests.rb
   ```

## How to Play

- Begin by executing the file main.rb inside the repositories /bin folder.
- An instruction board is shown in order to specify the places on the board
  - 1 | 2 | 3
  - 4 | 5 | 6
  - 7 | 8 | 9
- Follow the prompts
- Enter players names and continue
- Selections must correspond to the numbers shown above. If user types '1' when turn reached, their piece will be placed at position one on the board

  - X | _ | _
  - _ | _ | _
  - _ | _ | _

 Note: The goal is to be the first to place pieces in the orders mentioned, below shows how player two wins

 - X | O | X
 - X | O | _
 - _ | O | X

- The game prompts for a response of whether you wish to continue or not once there is a win or draw. The game exits if user wants to quit or viceversa if yes is selected

 ![Demo](https://user-images.githubusercontent.com/36812672/77720794-f007de80-6fb6-11ea-86f6-49410669b791.gif)

 ![Board](https://user-images.githubusercontent.com/36812672/77721727-acfb3a80-6fb9-11ea-93bf-6a779ffd52c4.png)

## Authors  ![Hireable](https://img.shields.io/badge/HIREABLE-YES-yellowgreen&?style=for-the-badge)

👤 **Peter Robert**

- Github: [@peterrobert](https://github.com/peterrobert)
- Twitter: [@ptahwambui93](https://twitter.com/Ptahwambui93)
- Linkedin: [Peter Robert Ndungu](https://www.linkedin.com/in/peter-rob-ndungu/)

👤 **Sergio Zambrano**

- Github: [@sergiomauz](https://github.com/sergiomauz)
- Twitter: [@sergiomauz](https://twitter.com/sergiomauz)
- Linkedin: [Sergio Zambrano](https://www.linkedin.com/in/sergiomauz/)

## 🤝 Contributing

Contributions, issues and feature requests are welcome!. Feel free to check the [issues page](issues/).

## Show your support

Give a ⭐️ if you like this project!

## 📝 License

This project is [MIT](LICENSE) licensed.