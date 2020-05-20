# _Name of Application_

#### | May 15th. 2020_

#### By _** Josh Hellman**_
[link to demo site](https://sheltered-journey-72637.herokuapp.com/)

## Description

This app will let a user add a Word to the page, users can edit words and delete them. a user can also add definition(s) to words, add edit or delete a definition  
 
## Setup/Installation Requirements

_Make sure you have [Ruby](https://www.ruby-lang.org/en/documentation/installation) installed on your computer._

_Make sure you have [git version control](https://git-scm.com/downloads) installed on your computer._


1. find the green 'Clone or Download' button and copy the link
2. open terminal and type...

**Windows**
```sh 
cd desktop
```

 Mac & linux 
 ```sh
 cd ~/Desktop
 ```

 3. in terminal type '_git clone https://github.com/jhell85/anagrams_antigrams.git_ '

```sh
git clone https://github.com/jhell85/anagrams_antigrams.git
```

4. navigate to the new folder that was created on your desk
```sh
cd folder name
```

5. run bundle 

```sh
  bundle
```

6. run ruby app.rb then in your browsers URL bar type 'http://localhost:4567' and view the app from your own machine

```sh
  ruby app.rb
```


## Specs
### Behavior Driven Development Spec List

Behavoir | Input | Output
:---------|:------:|:------:
|1 - The program will let a user  input and save a word | 'hello' | 'hello' is saved |
|1 - The program will show a user all words that have been inputted | 'hello' | display shows 'hello' |
|1 - The program will let a user edit an inputted word | 'hello' => edited to 'bye' | display shows 'bye' |
|1 - The program will let a user delete an inputted word | 'hello' => deleted  | display has removed word |
|1 - The program will let a user input a definition for a word | 'hello' => definition => 'a greeting' | 'hello' has a definition of 'a greeting' |
|1 - The program will let a user see all the inputted definitions for a word | 'hello' => definition => 'a greeting' | display shows 'hello' as a word and 'a greeting' as a definition for it|
|1 - The program will let a user edit an inputted definition | 'hello' => definition edited => 'formal greeting'  | 'hello' has a definition of 'formal greeting' |
|1 - The program will let a user delete an inputted definition| 'hello'=>definition deleted | 'hello' shows no definitions |


## Support 

_The software is provided as is. It might work as expected - or not. Use at your own risk._


## Built With

* [Ruby](https://www.ruby-lang.org/en/) - Primary Language
* [HTML](https://developer.mozilla.org/en-US/docs/Web/HTML) - Simple Scaffolding
* [JavaScript](https://developer.mozilla.org/en-US/docs/Web/JavaScript) - Used for interactivity in the page 
* [jQuery](https://jquery.com/) - Used to interact with the DOM
* [Bootstrap 4.4](https://getbootstrap.com/) - Used for styling


### License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

Copyright (c) 2020 **_Josh Hellman_**