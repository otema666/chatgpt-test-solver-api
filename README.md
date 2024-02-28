
# ChatGpt TestSolver Api

This is a Windows adn Linux application designed to quickly solve multiple-choice questions automatically. The program listens for the user to press the <kbd>Ctrl + Alt + 0</kbd> key combination. When this key combination is detected, the application captures the current contents of the clipboard (the user must first copy the question using <kbd>Ctrl + C</kbd>), sends it to ChatGPT for processing, and then forwards the generated response to a specified Discord webhook and also copy it to clipboard.


## Prompt
The script includes a [prompt](https://github.com/otema666/chatgpt-test-solver-api/blob/main/prompt.txt) to guide ChatGPT on how it should respond. Here it is:


```
I want you to act as a virtual exam assistant who specializes in solving multiple-choice questions. Your task is to
analyze various options provided for each question. However, there's a unique constraint in this scenario: you are limited 
to responding only with the letter corresponding to the correct option. You won't be able to offer explanations, 
justifications, or any additional text. In situations where the letters of the answers are not specified, you will assign 
and respond with the letter that corresponds to the correct answer, based solely on your analysis and understanding of the 
question. Remember, your responses should be concise, directly indicating the choice you determine to be correct. Let's 
start.
```

## Setting Up

## Windows

### Step 1: Clone the Repository

Clone the repository to your local machine using:

```sh
git clone https://github.com/otema666/chatgpt-test-solver-api.git
```

### Step 2: Install Python Dependencies

Open the file:

```
install_requirements.bat
```

### Step 3: Configure the Python Script

1. Open `main.py` in a text editor.
2. Replace `<api_key>` with your [OpenAI API key](https://platform.openai.com/api-keys).
3. Replace `<webhook_url>` with your [Discord webhook URL](https://support.discord.com/hc/en-us/articles/228383668-Intro-to-Webhooks).

## Linux

```sh
git clone https://github.com/otema666/chatgpt-test-solver-api.git && cd chatgpt-test-solver-api/linux/ && bash install.sh 
```
* Enter [OpenAI API key](https://platform.openai.com/api-keys) when asked
* Script will be configured on startup.
* To change api key manually, open linux/clipboar_main.py and replace `api_key` var.

## Usage (Windows)

#### If you have the gcc compiler:
  1. Open `loader.bat` (if you have **Windows 10/11 HOME** use `loadWinHOME.bat`)
  2. To kill the process, use `kill.bat` (if you have **Windows 10/11 HOME** use `killWinHOME.bat`)
  3. `clipboard.exe` will run in the background, waiting for your keyboard press.

#### If not, you can download the clipboard from [here](https://github.com/otema666/chatgpt-test-solver-api/releases/download/v0.1.0/clipboard.exe)
  1. Move the downloaded .exe to the repo folder
  2. Run `clipboard.exe`
  3. To kill the process, use `kill.bat` (if you have Windows 10/11 HOME use `killWinHOME.bat`)


3. Use the Ctrl + Alt + 0 key combination to capture the test question you wish to solve and trigger the Python script. Ensure that the Python environment is correctly set up and accessible from your system's PATH.

## Notes

- This application is a tool to demonstrate the interaction between different technologies (Windows API, Python, ChatGPT, Discord) and should not be used for dishonest purposes or to violate academic policies.
- Ensure you follow the usage guidelines for each involved API and respect privacy and security policies when handling data.

## License

This project is distributed under the MIT License. See the LICENSE file for more details.
