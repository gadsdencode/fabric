<div align="center">

<img src="./images/fabric-logo-gif.gif" alt="fabriclogo" width="400" height="400"/>

# `fabric`

![Static Badge](https://img.shields.io/badge/mission-human_flourishing_via_AI_augmentation-purple)
<br />
![GitHub top language](https://img.shields.io/github/languages/top/danielmiessler/fabric)
![GitHub last commit](https://img.shields.io/github/last-commit/danielmiessler/fabric)
[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](https://opensource.org/licenses/MIT)

<p class="align center">
<h4><code>fabric</code> is an open-source framework for augmenting humans using AI.</h4>
</p>

[Introduction Video](#introduction-video) •
[What and Why](#whatandwhy) •
[Philosophy](#philosophy) •
[Quickstart](#quickstart) •
[Structure](#structure) •
[Examples](#examples) •
[Meta](#meta)

</div>

## Navigation

- [Introduction Video](#introduction-video)
- [What and Why](#what-and-why)
- [Philosophy](#philosophy)
  - [Breaking problems into components](#breaking-problems-into-components)
  - [Too many prompts](#too-many-prompts)
  - [The Fabric approach to prompting](#our-approach-to-prompting)
- [Quickstart](#quickstart)
  - [Setting up the fabric commands](#setting-up-the-fabric-commands)
  - [Using the fabric client](#using-the-fabric-client)
  - [Just use the Patterns](#just-use-the-patterns)
  - [Create your own Fabric Mill](#create-your-own-fabric-mill)
- [Structure](#structure)
  - [Components](#components)
  - [CLI-native](#cli-native)
  - [Directly calling Patterns](#directly-calling-patterns)
- [Examples](#examples)
- [Meta](#meta)
  - [Primary contributors](#primary-contributors)

<br />

## Introduction video

<div align="center">
<a href="https://youtu.be/wPEyyigh10g">
  <img width="972" alt="fabric_intro_video" src="https://github.com/danielmiessler/fabric/assets/50654/1eb1b9be-0bab-4c77-8ed2-ed265e8a3435">
</a>
</div>

## What and why

Since the start of 2023 and GenAI we've seen a massive number of AI applications for accomplishing tasks. It's powerful, but _it's not easy to integrate this functionality into our lives._

<div align="center">
<h4>In other words, AI doesn't have a capabilities problem—it has an <em>integration</em> problem.</h4>
</div>

Fabric was created to address this by enabling everyone to granularly apply AI to everyday challenges.

## Philosophy

> AI isn't a thing; it's a _magnifier_ of a thing. And that thing is **human creativity**.

We believe the purpose of technology is to help humans flourish, so when we talk about AI we start with the **human** problems we want to solve.

### Breaking problems into components

Our approach is to break problems into individual pieces (see below) and then apply AI to them one at a time. See below for some examples.

<img width="2078" alt="augmented_challenges" src="https://github.com/danielmiessler/fabric/assets/50654/31997394-85a9-40c2-879b-b347e4701f06">

### Too many prompts

Prompts are good for this, but the biggest challenge I faced in 2023——which still exists today—is **the sheer number of AI prompts out there**. We all have prompts that are useful, but it's hard to discover new ones, know if they are good or not, _and manage different versions of the ones we like_.

One of <code>fabric</code>'s primary features is helping people collect and integrate prompts, which we call _Patterns_, into various parts of their lives.

Fabric has Patterns for all sorts of life and work activities, including:

- Extracting the most interesting parts of YouTube videos and podcasts
- Writing an essay in your own voice with just an idea as an input
- Summarizing opaque academic papers
- Creating perfectly matched AI art prompts for a piece of writing
- Rating the quality of content to see if you want to read/watch the whole thing
- Getting summaries of long, boring content
- Explaining code to you
- Turning bad documentation into usable documentation
- Creating social media posts from any content input
- And a million more…

### Our approach to prompting

Fabric _Patterns_ are different than most prompts you'll see.

- **First, we use `Markdown` to help ensure maximum readability and editability**. This not only helps the creator make a good one, but also anyone who wants to deeply understand what it does. _Importantly, this also includes the AI you're sending it to!_

Here's an example of a Fabric Pattern.

```bash
https://github.com/danielmiessler/fabric/blob/main/patterns/extract_wisdom/system.md
```

<img width="1461" alt="pattern-example" src="https://github.com/danielmiessler/fabric/assets/50654/b910c551-9263-405f-9735-71ca69bbab6d">

- **Next, we are extremely clear in our instructions**, and we use the Markdown structure to emphasize what we want the AI to do, and in what order.

- **And finally, we tend to use the System section of the prompt almost exclusively**. In over a year of being heads-down with this stuff, we've just seen more efficacy from doing that. If that changes, or we're shown data that says otherwise, we will adjust.

## Quickstart

The most feature-rich way to use Fabric is to use the `fabric` client, which can be found under <a href="https://github.com/danielmiessler/fabric/tree/main/client">`/client`</a> directory in this repository.

### Setting up the fabric commands

Follow these steps to get all fabric related apps installed and configured.

1. Navigate to where you want the Fabric project to live on your system in a semi-permanent place on your computer.

```bash
# Find a home for Fabric
cd /where/you/keep/code
```

2. Clone the project to your computer.

```bash
# Clone Fabric to your computer
git clone https://github.com/danielmiessler/fabric.git
```

3. Enter Fabric's main directory

```bash
# Enter the project folder (where you cloned it)
cd fabric
```

4. Ensure the `setup.sh` script is executable. If you're not sure, you can make it executable by running the following command:

```bash
chmod +x setup.sh
```

5. Install poetry

ref.: https://python-poetry.org/docs/#installing-with-the-official-installer

```bash
curl -sSL https://install.python-poetry.org | python3 -
```

6. Run the `setup.sh`, which will do the following:

- Installs python dependencies.
- Creates aliases in your OS. It should update `~/.bashrc`, `/.zshrc`, and `~/.bash_profile` if they are present in your file system.

```bash
./setup.sh
```

7. Restart your shell to reload everything.

8. Set your `OPENAI_API_KEY`.

```bash
fabric --setup
```

You'll be asked to enter your OpenAI API key, which will be written to `~/.config/fabric/.env`. Patterns will then be downloaded from Github, which will take a few moments.

9. Now you are up and running! You can test by pulling the help.

```bash
# Making sure the paths are set up correctly
fabric --help
```

> [!NOTE]  
> If you're using the `server` functions, `fabric-api` and `fabric-webui` need to be run in distinct terminal windows.

### Using the `fabric` client

Once you have it all set up, here's how to use it.

1. Check out the options
   `fabric -h`

```bash
fabric [-h] [--text TEXT] [--copy] [--output [OUTPUT]] [--stream] [--list]
              [--update] [--pattern PATTERN] [--setup]

An open-source framework for augmenting humans using AI.

options:
  -h, --help            show this help message and exit
  --text TEXT, -t TEXT  Text to extract summary from
  --copy, -c            Copy the response to the clipboard
  --output [OUTPUT], -o [OUTPUT]
                        Save the response to a file
  --stream, -s          Use this option if you want to see the results in realtime.
                        NOTE: You will not be able to pipe the output into another
                        command.
  --list, -l            List available patterns
  --update, -u          Update patterns
  --pattern PATTERN, -p PATTERN
                        The pattern (prompt) to use
  --setup               Set up your fabric instance
```

#### Example commands

The client, by default, runs Fabric patterns without needing a server (the Patterns were downloaded during setup). This means the client connects directly to OpenAI using the input given and the Fabric pattern used.

1. Run the `summarize` Pattern based on input from `stdin`. In this case, the body of an article.

```bash
pbpaste | fabric --pattern summarize
```

2. Run the `analyze_claims` Pattern with the `--stream` option to get immediate and streaming results.

```bash
pbpaste | fabric --stream --pattern analyze_claims
```

3. **new** All of the patterns have been added as aliases to your bash (or zsh) config file

```bash
pbpaste | analyze_claims --stream
```

> [!NOTE]  
> More examples coming in the next few days, including a demo video!

### Just use the Patterns

<img width="1173" alt="fabric-patterns-screenshot" src="https://github.com/danielmiessler/fabric/assets/50654/9186a044-652b-4673-89f7-71cf066f32d8">

<br />

If you're not looking to do anything fancy, and you just want a lot of great prompts, you can navigate to the [`/patterns`](https://github.com/danielmiessler/fabric/tree/main/patterns) directory and start exploring!

We hope that if you used nothing else from Fabric, the Patterns by themselves will make the project useful.

You can use any of the Patterns you see there in any AI application that you have, whether that's ChatGPT or some other app or website. Our plan and prediction is that people will soon be sharing many more than those we've published, and they will be way better than ours.

The wisdom of crowds for the win.

### Create your own Fabric Mill

<img width="2070" alt="fabric_mill_architecture" src="https://github.com/danielmiessler/fabric/assets/50654/ec3bd9b5-d285-483d-9003-7a8e6d842584">

<br />

But we go beyond just providing Patterns. We provide code for you to build your very own Fabric server and personal AI infrastructure!

To get started, just run the `./setup.sh` file and it'll set up the client, the API server, and the API server web interface. The output of the setup command will also tell you how to run the commands to start them.

## Structure

Fabric is themed off of, well… _fabric_—as in…woven materials. So, think blankets, quilts, patterns, etc. Here's the concept and structure:

### Components

The Fabric ecosystem has three primary components, all named within this textile theme.

- The **Mill** is the (optional) server that makes **Patterns** available.
- **Patterns** are the actual granular AI use cases (prompts).
- **Stitches** are chained together _Patterns_ that create advanced functionality (see below).
- **Looms** are the client-side apps that call a specific **Pattern** hosted by a **Mill**.

### CLI-native

One of the coolest parts of the project is that it's **command-line native**!

Each Pattern you see in the `/patterns` directory can be used in any AI application you use, but you can also set up your own server using the `/server` code and then call APIs directly!

Once you're set up, you can do things like:

```bash
# Take any idea from `stdin` and send it to the `/write_essay` API!
cat "An idea that coding is like speaking with rules." | write_essay
```

### Directly calling Patterns

One key feature of `fabric` and its Markdown-based format is the ability to _ directly reference_ (and edit) individual [patterns](https://github.com/danielmiessler/fabric/tree/main#naming) directly—on their own—without surrounding code.

As an example, here's how to call _the direct location_ of the `extract_wisdom` pattern.

```bash
https://github.com/danielmiessler/fabric/blob/main/patterns/extract_wisdom/system.md
```

This means you can cleanly, and directly reference any pattern for use in a web-based AI app, your own code, or wherever!

Even better, you can also have your [Mill](https://github.com/danielmiessler/fabric/tree/main#naming) functionality directly call _system_ and _user_ prompts from `fabric`, meaning you can have your personal AI ecosystem automatically kept up to date with the latest version of your favorite [Patterns](https://github.com/danielmiessler/fabric/tree/main#naming).

Here's what that looks like in code:

```bash
https://github.com/danielmiessler/fabric/blob/main/server/fabric_api_server.py
```

```python
# /extwis
@app.route("/extwis", methods=["POST"])
@auth_required  # Require authentication
def extwis():
    data = request.get_json()

    # Warn if there's no input
    if "input" not in data:
        return jsonify({"error": "Missing input parameter"}), 400

    # Get data from client
    input_data = data["input"]

    # Set the system and user URLs
    system_url = "https://raw.githubusercontent.com/danielmiessler/fabric/main/patterns/extract_wisdom/system.md"
    user_url = "https://raw.githubusercontent.com/danielmiessler/fabric/main/patterns/extract_wisdom/user.md"

    # Fetch the prompt content
    system_content = fetch_content_from_url(system_url)
    user_file_content = fetch_content_from_url(user_url)

    # Build the API call
    system_message = {"role": "system", "content": system_content}
    user_message = {"role": "user", "content": user_file_content + "\n" + input_data}
    messages = [system_message, user_message]
    try:
        response = openai.chat.completions.create(
            model="gpt-4-1106-preview",
            messages=messages,
            temperature=0.0,
            top_p=1,
            frequency_penalty=0.1,
            presence_penalty=0.1,
        )
        assistant_message = response.choices[0].message.content
        return jsonify({"response": assistant_message})
    except Exception as e:
        return jsonify({"error": str(e)}), 500
```

## Examples

Here's an abridged output example from the <a href="https://github.com/danielmiessler/fabric/blob/main/patterns/extract_wisdom/system.md">`extract_wisdom`</a> pattern (limited to only 10 items per section).

```bash
# Paste in the transcript of a YouTube video of Riva Tez on David Perrel's podcast
pbpaste | extract_wisdom
```

```markdown
## SUMMARY:

The content features a conversation between two individuals discussing various topics, including the decline of Western culture, the importance of beauty and subtlety in life, the impact of technology and AI, the resonance of Rilke's poetry, the value of deep reading and revisiting texts, the captivating nature of Ayn Rand's writing, the role of philosophy in understanding the world, and the influence of drugs on society. They also touch upon creativity, attention spans, and the importance of introspection.

## IDEAS:

1. Western culture is perceived to be declining due to a loss of values and an embrace of mediocrity.
2. Mass media and technology have contributed to shorter attention spans and a need for constant stimulation.
3. Rilke's poetry resonates due to its focus on beauty and ecstasy in everyday objects.
4. Subtlety is often overlooked in modern society due to sensory overload.
5. The role of technology in shaping music and performance art is significant.
6. Reading habits have shifted from deep, repetitive reading to consuming large quantities of new material.
7. Revisiting influential books as one ages can lead to new insights based on accumulated wisdom and experiences.
8. Fiction can vividly illustrate philosophical concepts through characters and narratives.
9. Many influential thinkers have backgrounds in philosophy, highlighting its importance in shaping reasoning skills.
10. Philosophy is seen as a bridge between theology and science, asking questions that both fields seek to answer.

## QUOTES:

1. "You can't necessarily think yourself into the answers. You have to create space for the answers to come to you."
2. "The West is dying and we are killing her."
3. "The American Dream has been replaced by mass packaged mediocrity porn, encouraging us to revel like happy pigs in our own meekness."
4. "There's just not that many people who have the courage to reach beyond consensus and go explore new ideas."
5. "I'll start watching Netflix when I've read the whole of human history."
6. "Rilke saw beauty in everything... He sees it's in one little thing, a representation of all things that are beautiful."
7. "Vanilla is a very subtle flavor... it speaks to sort of the sensory overload of the modern age."
8. "When you memorize chapters [of the Bible], it takes a few months, but you really understand how things are structured."
9. "As you get older, if there's books that moved you when you were younger, it's worth going back and rereading them."
10. "She [Ayn Rand] took complicated philosophy and embodied it in a way that anybody could resonate with."

## HABITS:

1. Avoiding mainstream media consumption for deeper engagement with historical texts and personal research.
2. Regularly revisiting influential books from youth to gain new insights with age.
3. Engaging in deep reading practices rather than skimming or speed-reading material.
4. Memorizing entire chapters or passages from significant texts for better understanding.
5. Disengaging from social media and fast-paced news cycles for more focused thought processes.
6. Walking long distances as a form of meditation and reflection.
7. Creating space for thoughts to solidify through introspection and stillness.
8. Embracing emotions such as grief or anger fully rather than suppressing them.
9. Seeking out varied experiences across different careers and lifestyles.
10. Prioritizing curiosity-driven research without specific goals or constraints.

## FACTS:

1. The West is perceived as declining due to cultural shifts away from traditional values.
2. Attention spans have shortened due to technological advancements and media consumption habits.
3. Rilke's poetry emphasizes finding beauty in everyday objects through detailed observation.
4. Modern society often overlooks subtlety due to sensory overload from various stimuli.
5. Reading habits have evolved from deep engagement with texts to consuming large quantities quickly.
6. Revisiting influential books can lead to new insights based on accumulated life experiences.
7. Fiction can effectively illustrate philosophical concepts through character development and narrative arcs.
8. Philosophy plays a significant role in shaping reasoning skills and understanding complex ideas.
9. Creativity may be stifled by cultural nihilism and protectionist attitudes within society.
10. Short-term thinking undermines efforts to create lasting works of beauty or significance.

## REFERENCES:

1. Rainer Maria Rilke's poetry
2. Netflix
3. Underworld concert
4. Katy Perry's theatrical performances
5. Taylor Swift's performances
6. Bible study
7. Atlas Shrugged by Ayn Rand
8. Robert Pirsig's writings
9. Bertrand Russell's definition of philosophy
10. Nietzsche's walks
```

## Meta

> [!NOTE]  
> Special thanks to the following people for their inspiration and contributions!

- _Caleb Sima_ for pushing me over the edge of whether to make this a public project or not.
- _Joel Parish_ for super useful input on the project's Github directory structure.
- _Jonathan Dunn_ for spectacular work on the soon-to-be-released universal client.
- _Joseph Thacker_ for the idea of a `-c` context flag that adds pre-created context in the `./config/fabric/` directory to all Pattern queries.
- _Jason Haddix_ for the idea of a stitch (chained Pattern) to filter content using a local model before sending on to a cloud model, i.e., cleaning customer data using `llama2` before sending on to `gpt-4` for analysis.
- _Dani Goland_ for enhancing the Fabric Server (Mill) infrastructure by migrating to FastAPI, breaking the server into discrete pieces, and Dockerizing the entire thing.
- _Andre Guerra_ for simplifying installation by getting us onto Poetry for virtual environment and dependency management.

### Primary contributors

<a href="https://github.com/danielmiessler"><img src="https://avatars.githubusercontent.com/u/50654?v=4" title="Daniel Miessler" width="50" height="50"></a>
<a href="https://github.com/xssdoctor"><img src="https://avatars.githubusercontent.com/u/9218431?v=4" title="Jonathan Dunn" width="50" height="50"></a>
<a href="https://github.com/sbehrens"><img src="https://avatars.githubusercontent.com/u/688589?v=4" title="Scott Behrens" width="50" height="50"></a>
<a href="https://github.com/agu3rra"><img src="https://avatars.githubusercontent.com/u/10410523?v=4" title="Andre Guerra" width="50" height="50"></a>

`fabric` was created by <a href="https://danielmiessler.com/subscribe" target="_blank">Daniel Miessler</a> in January of 2024.
<br /><br />
<a href="https://twitter.com/intent/user?screen_name=danielmiessler">![X (formerly Twitter) Follow](https://img.shields.io/twitter/follow/danielmiessler)</a>

```
fabric
├─ .git
│  ├─ COMMIT_EDITMSG
│  ├─ config
│  ├─ description
│  ├─ FETCH_HEAD
│  ├─ HEAD
│  ├─ hooks
│  │  ├─ applypatch-msg.sample
│  │  ├─ commit-msg.sample
│  │  ├─ fsmonitor-watchman.sample
│  │  ├─ post-update.sample
│  │  ├─ pre-applypatch.sample
│  │  ├─ pre-commit.sample
│  │  ├─ pre-merge-commit.sample
│  │  ├─ pre-push.sample
│  │  ├─ pre-rebase.sample
│  │  ├─ pre-receive.sample
│  │  ├─ prepare-commit-msg.sample
│  │  ├─ push-to-checkout.sample
│  │  ├─ sendemail-validate.sample
│  │  └─ update.sample
│  ├─ index
│  ├─ info
│  │  └─ exclude
│  ├─ logs
│  │  ├─ HEAD
│  │  └─ refs
│  │     ├─ heads
│  │     │  ├─ agents
│  │     │  ├─ goVersion
│  │     │  └─ main
│  │     └─ remotes
│  │        └─ origin
│  │           ├─ agents
│  │           └─ HEAD
│  ├─ objects
│  │  ├─ 08
│  │  │  └─ 28c6ab1281238dc4cc6e8878d9ea6df11be59e
│  │  ├─ 2e
│  │  │  └─ 53d53b3bc17092e82089d5e6ba2f09b6dd871a
│  │  ├─ 30
│  │  │  └─ 8d3fd59f68ddea154d69aeeefabae3eae8232f
│  │  ├─ 3d
│  │  │  └─ 7b36f694f4db1703ac2be5100daf8ec642b66e
│  │  ├─ 46
│  │  │  └─ 1ed488d4c2185ba42f24e1309e8b13a9204f51
│  │  ├─ 53
│  │  │  └─ fbf2c8c03fa1a23f39a2f437aa067448653b7d
│  │  ├─ 5f
│  │  │  └─ db489cbb2acec9f57c84dbe35e4c2462cb6739
│  │  ├─ 63
│  │  │  └─ 784f92c17771ac147f9bfa951766ab1db7c10e
│  │  ├─ 67
│  │  │  └─ 53db6ffa425047169c66dd5a1dee469f1324c0
│  │  ├─ 6f
│  │  │  └─ 1e968c5ce08486ed929211888af78524d2c279
│  │  ├─ 73
│  │  │  └─ fc12ad99fed593ddb38c1af298a70e9ec5689b
│  │  ├─ 77
│  │  │  └─ f8d5a448a4dd67149e6dcb632bd43becc5a3e2
│  │  ├─ 7d
│  │  │  └─ 399de3ebaf40d86dfc80eef717acf62c1bdd3a
│  │  ├─ 88
│  │  │  └─ 7ddd99100736a44098983a43d980f254570d6d
│  │  ├─ 8b
│  │  │  └─ 91fb760130b2bb1af6bc9d6f4cd78d0c320b94
│  │  ├─ 92
│  │  │  └─ 8a32612a1d6f9ffe4ee73d04abb29bf4cb9b19
│  │  ├─ a3
│  │  │  └─ 3d3c5537d8ae07b310c2a096f9966c48d5c570
│  │  ├─ a4
│  │  │  └─ f8bbbfeb83461a83203e0d8c8210bdbba95a8f
│  │  ├─ a6
│  │  │  └─ 8b543f0306af859a7134e2fd109cc8cc4297dd
│  │  ├─ b0
│  │  │  └─ 9db808f98cb7be58e316c56d0aa6e08c057306
│  │  ├─ b7
│  │  │  └─ 9e29bb7e6c405f01cfac2a716e22b50207c9d4
│  │  ├─ bd
│  │  │  └─ 355f5061a8e99e601e64829c059e5fc0fc83a0
│  │  ├─ c3
│  │  │  └─ c138d2c2afdb3b0abe5e0b2c09bf133b4ff56d
│  │  ├─ c5
│  │  │  └─ e3fc982390616d613162c5bc1742a320ea089a
│  │  ├─ cc
│  │  │  └─ dfbe70a79d6a776f1f308f7f6039599beb5b6d
│  │  ├─ cd
│  │  │  └─ e8ea4afae70241aaf39b28e013dd85048a398d
│  │  ├─ e9
│  │  │  └─ f38f04daff7480c5fde6e23fb39d9b05ba29d6
│  │  ├─ ea
│  │  │  └─ ca811045c8f0a926eddbe56d5cc09441f9cfbf
│  │  ├─ ef
│  │  │  └─ 965c5e52ad0e9342514828bcd53cd727f96774
│  │  ├─ f6
│  │  │  └─ 29c7e12070a6ab8694f95c3b17a7b43135c50f
│  │  ├─ f9
│  │  │  └─ 6121c0023fee68098653881d71bb46b9e389e0
│  │  ├─ fc
│  │  │  └─ 9e41a2c3271308855f97aba32e8fb9cb53d99e
│  │  ├─ info
│  │  └─ pack
│  │     ├─ pack-4ae0dbabffb9aef30d29d98838b042be2a6360e8.idx
│  │     ├─ pack-4ae0dbabffb9aef30d29d98838b042be2a6360e8.pack
│  │     └─ pack-4ae0dbabffb9aef30d29d98838b042be2a6360e8.rev
│  ├─ ORIG_HEAD
│  ├─ packed-refs
│  └─ refs
│     ├─ heads
│     │  ├─ agents
│     │  ├─ goVersion
│     │  └─ main
│     ├─ remotes
│     │  └─ origin
│     │     ├─ agents
│     │     └─ HEAD
│     └─ tags
├─ .github
│  ├─ ISSUE_TEMPLATE
│  │  ├─ bug.yml
│  │  ├─ feature-request.yml
│  │  └─ question.yml
│  └─ pull_request_template.md
├─ .gitignore
├─ .python-version
├─ Dockerfile
├─ helpers
│  └─ vm
├─ images
│  └─ fabric-logo-gif.gif
├─ installer
│  ├─ client
│  │  ├─ cli
│  │  │  ├─ agents
│  │  │  │  ├─ .python-version
│  │  │  │  ├─ example.py
│  │  │  │  └─ trip_planner
│  │  │  │     ├─ main.py
│  │  │  │     ├─ tools
│  │  │  │     │  ├─ browser_tools.py
│  │  │  │     │  ├─ calculator_tools.py
│  │  │  │     │  ├─ search_tools.py
│  │  │  │     │  └─ __init__.py
│  │  │  │     ├─ trip_agents.py
│  │  │  │     └─ trip_tasks.py
│  │  │  ├─ context.md
│  │  │  ├─ fabric.py
│  │  │  ├─ p.py
│  │  │  ├─ README.md
│  │  │  ├─ utils.py
│  │  │  └─ __init__.py
│  │  └─ gui
│  │     ├─ .gitignore
│  │     ├─ chatgpt.js
│  │     ├─ index.html
│  │     ├─ main.js
│  │     ├─ node_modules
│  │     │  ├─ .bin
│  │     │  │  ├─ electron
│  │     │  │  ├─ electron.cmd
│  │     │  │  ├─ electron.ps1
│  │     │  │  ├─ extract-zip
│  │     │  │  ├─ extract-zip.cmd
│  │     │  │  ├─ extract-zip.ps1
│  │     │  │  ├─ mammoth
│  │     │  │  ├─ mammoth.cmd
│  │     │  │  ├─ mammoth.ps1
│  │     │  │  ├─ mkdirp
│  │     │  │  ├─ mkdirp.cmd
│  │     │  │  ├─ mkdirp.ps1
│  │     │  │  ├─ openai
│  │     │  │  ├─ openai.cmd
│  │     │  │  ├─ openai.ps1
│  │     │  │  ├─ rimraf
│  │     │  │  ├─ rimraf.cmd
│  │     │  │  ├─ rimraf.ps1
│  │     │  │  ├─ semver
│  │     │  │  ├─ semver.cmd
│  │     │  │  └─ semver.ps1
│  │     │  ├─ .package-lock.json
│  │     │  ├─ @electron
│  │     │  │  └─ get
│  │     │  │     ├─ LICENSE
│  │     │  │     ├─ package.json
│  │     │  │     └─ README.md
│  │     │  ├─ @sindresorhus
│  │     │  │  └─ is
│  │     │  │     ├─ license
│  │     │  │     ├─ package.json
│  │     │  │     └─ readme.md
│  │     │  ├─ @szmarczak
│  │     │  │  └─ http-timer
│  │     │  │     ├─ LICENSE
│  │     │  │     ├─ package.json
│  │     │  │     └─ README.md
│  │     │  ├─ @types
│  │     │  │  ├─ cacheable-request
│  │     │  │  │  ├─ index.d.ts
│  │     │  │  │  ├─ LICENSE
│  │     │  │  │  ├─ package.json
│  │     │  │  │  └─ README.md
│  │     │  │  ├─ http-cache-semantics
│  │     │  │  │  ├─ index.d.ts
│  │     │  │  │  ├─ LICENSE
│  │     │  │  │  ├─ package.json
│  │     │  │  │  └─ README.md
│  │     │  │  ├─ keyv
│  │     │  │  │  ├─ index.d.ts
│  │     │  │  │  ├─ LICENSE
│  │     │  │  │  ├─ package.json
│  │     │  │  │  └─ README.md
│  │     │  │  ├─ node
│  │     │  │  │  ├─ assert
│  │     │  │  │  │  └─ strict.d.ts
│  │     │  │  │  ├─ assert.d.ts
│  │     │  │  │  ├─ async_hooks.d.ts
│  │     │  │  │  ├─ buffer.d.ts
│  │     │  │  │  ├─ child_process.d.ts
│  │     │  │  │  ├─ cluster.d.ts
│  │     │  │  │  ├─ console.d.ts
│  │     │  │  │  ├─ constants.d.ts
│  │     │  │  │  ├─ crypto.d.ts
│  │     │  │  │  ├─ dgram.d.ts
│  │     │  │  │  ├─ diagnostics_channel.d.ts
│  │     │  │  │  ├─ dns
│  │     │  │  │  │  └─ promises.d.ts
│  │     │  │  │  ├─ dns.d.ts
│  │     │  │  │  ├─ dom-events.d.ts
│  │     │  │  │  ├─ domain.d.ts
│  │     │  │  │  ├─ events.d.ts
│  │     │  │  │  ├─ fs
│  │     │  │  │  │  └─ promises.d.ts
│  │     │  │  │  ├─ fs.d.ts
│  │     │  │  │  ├─ globals.d.ts
│  │     │  │  │  ├─ globals.global.d.ts
│  │     │  │  │  ├─ http.d.ts
│  │     │  │  │  ├─ http2.d.ts
│  │     │  │  │  ├─ https.d.ts
│  │     │  │  │  ├─ index.d.ts
│  │     │  │  │  ├─ inspector.d.ts
│  │     │  │  │  ├─ LICENSE
│  │     │  │  │  ├─ module.d.ts
│  │     │  │  │  ├─ net.d.ts
│  │     │  │  │  ├─ os.d.ts
│  │     │  │  │  ├─ package.json
│  │     │  │  │  ├─ path.d.ts
│  │     │  │  │  ├─ perf_hooks.d.ts
│  │     │  │  │  ├─ process.d.ts
│  │     │  │  │  ├─ punycode.d.ts
│  │     │  │  │  ├─ querystring.d.ts
│  │     │  │  │  ├─ readline
│  │     │  │  │  │  └─ promises.d.ts
│  │     │  │  │  ├─ readline.d.ts
│  │     │  │  │  ├─ README.md
│  │     │  │  │  ├─ repl.d.ts
│  │     │  │  │  ├─ stream
│  │     │  │  │  │  ├─ consumers.d.ts
│  │     │  │  │  │  ├─ promises.d.ts
│  │     │  │  │  │  └─ web.d.ts
│  │     │  │  │  ├─ stream.d.ts
│  │     │  │  │  ├─ string_decoder.d.ts
│  │     │  │  │  ├─ test.d.ts
│  │     │  │  │  ├─ timers
│  │     │  │  │  │  └─ promises.d.ts
│  │     │  │  │  ├─ timers.d.ts
│  │     │  │  │  ├─ tls.d.ts
│  │     │  │  │  ├─ trace_events.d.ts
│  │     │  │  │  ├─ ts4.8
│  │     │  │  │  │  ├─ assert
│  │     │  │  │  │  │  └─ strict.d.ts
│  │     │  │  │  │  ├─ assert.d.ts
│  │     │  │  │  │  ├─ async_hooks.d.ts
│  │     │  │  │  │  ├─ buffer.d.ts
│  │     │  │  │  │  ├─ child_process.d.ts
│  │     │  │  │  │  ├─ cluster.d.ts
│  │     │  │  │  │  ├─ console.d.ts
│  │     │  │  │  │  ├─ constants.d.ts
│  │     │  │  │  │  ├─ crypto.d.ts
│  │     │  │  │  │  ├─ dgram.d.ts
│  │     │  │  │  │  ├─ diagnostics_channel.d.ts
│  │     │  │  │  │  ├─ dns
│  │     │  │  │  │  │  └─ promises.d.ts
│  │     │  │  │  │  ├─ dns.d.ts
│  │     │  │  │  │  ├─ dom-events.d.ts
│  │     │  │  │  │  ├─ domain.d.ts
│  │     │  │  │  │  ├─ events.d.ts
│  │     │  │  │  │  ├─ fs
│  │     │  │  │  │  │  └─ promises.d.ts
│  │     │  │  │  │  ├─ fs.d.ts
│  │     │  │  │  │  ├─ globals.d.ts
│  │     │  │  │  │  ├─ globals.global.d.ts
│  │     │  │  │  │  ├─ http.d.ts
│  │     │  │  │  │  ├─ http2.d.ts
│  │     │  │  │  │  ├─ https.d.ts
│  │     │  │  │  │  ├─ index.d.ts
│  │     │  │  │  │  ├─ inspector.d.ts
│  │     │  │  │  │  ├─ module.d.ts
│  │     │  │  │  │  ├─ net.d.ts
│  │     │  │  │  │  ├─ os.d.ts
│  │     │  │  │  │  ├─ path.d.ts
│  │     │  │  │  │  ├─ perf_hooks.d.ts
│  │     │  │  │  │  ├─ process.d.ts
│  │     │  │  │  │  ├─ punycode.d.ts
│  │     │  │  │  │  ├─ querystring.d.ts
│  │     │  │  │  │  ├─ readline
│  │     │  │  │  │  │  └─ promises.d.ts
│  │     │  │  │  │  ├─ readline.d.ts
│  │     │  │  │  │  ├─ repl.d.ts
│  │     │  │  │  │  ├─ stream
│  │     │  │  │  │  │  ├─ consumers.d.ts
│  │     │  │  │  │  │  ├─ promises.d.ts
│  │     │  │  │  │  │  └─ web.d.ts
│  │     │  │  │  │  ├─ stream.d.ts
│  │     │  │  │  │  ├─ string_decoder.d.ts
│  │     │  │  │  │  ├─ test.d.ts
│  │     │  │  │  │  ├─ timers
│  │     │  │  │  │  │  └─ promises.d.ts
│  │     │  │  │  │  ├─ timers.d.ts
│  │     │  │  │  │  ├─ tls.d.ts
│  │     │  │  │  │  ├─ trace_events.d.ts
│  │     │  │  │  │  ├─ tty.d.ts
│  │     │  │  │  │  ├─ url.d.ts
│  │     │  │  │  │  ├─ util.d.ts
│  │     │  │  │  │  ├─ v8.d.ts
│  │     │  │  │  │  ├─ vm.d.ts
│  │     │  │  │  │  ├─ wasi.d.ts
│  │     │  │  │  │  ├─ worker_threads.d.ts
│  │     │  │  │  │  └─ zlib.d.ts
│  │     │  │  │  ├─ tty.d.ts
│  │     │  │  │  ├─ url.d.ts
│  │     │  │  │  ├─ util.d.ts
│  │     │  │  │  ├─ v8.d.ts
│  │     │  │  │  ├─ vm.d.ts
│  │     │  │  │  ├─ wasi.d.ts
│  │     │  │  │  ├─ worker_threads.d.ts
│  │     │  │  │  └─ zlib.d.ts
│  │     │  │  ├─ node-fetch
│  │     │  │  │  ├─ externals.d.ts
│  │     │  │  │  ├─ index.d.ts
│  │     │  │  │  ├─ LICENSE
│  │     │  │  │  ├─ package.json
│  │     │  │  │  └─ README.md
│  │     │  │  ├─ responselike
│  │     │  │  │  ├─ index.d.ts
│  │     │  │  │  ├─ LICENSE
│  │     │  │  │  ├─ package.json
│  │     │  │  │  └─ README.md
│  │     │  │  └─ yauzl
│  │     │  │     ├─ index.d.ts
│  │     │  │     ├─ LICENSE
│  │     │  │     ├─ package.json
│  │     │  │     └─ README.md
│  │     │  ├─ @xmldom
│  │     │  │  └─ xmldom
│  │     │  │     ├─ CHANGELOG.md
│  │     │  │     ├─ index.d.ts
│  │     │  │     ├─ LICENSE
│  │     │  │     ├─ package.json
│  │     │  │     ├─ readme.md
│  │     │  │     └─ SECURITY.md
│  │     │  ├─ abort-controller
│  │     │  │  ├─ browser.js
│  │     │  │  ├─ browser.mjs
│  │     │  │  ├─ LICENSE
│  │     │  │  ├─ package.json
│  │     │  │  ├─ polyfill.js
│  │     │  │  ├─ polyfill.mjs
│  │     │  │  └─ README.md
│  │     │  ├─ agentkeepalive
│  │     │  │  ├─ browser.js
│  │     │  │  ├─ History.md
│  │     │  │  ├─ index.d.ts
│  │     │  │  ├─ index.js
│  │     │  │  ├─ LICENSE
│  │     │  │  ├─ package.json
│  │     │  │  └─ README.md
│  │     │  ├─ argparse
│  │     │  │  ├─ CHANGELOG.md
│  │     │  │  ├─ index.js
│  │     │  │  ├─ LICENSE
│  │     │  │  ├─ node_modules
│  │     │  │  │  └─ sprintf-js
│  │     │  │  │     ├─ .npmignore
│  │     │  │  │     ├─ bower.json
│  │     │  │  │     ├─ demo
│  │     │  │  │     │  └─ angular.html
│  │     │  │  │     ├─ gruntfile.js
│  │     │  │  │     ├─ LICENSE
│  │     │  │  │     ├─ package.json
│  │     │  │  │     ├─ README.md
│  │     │  │  │     ├─ src
│  │     │  │  │     │  ├─ angular-sprintf.js
│  │     │  │  │     │  └─ sprintf.js
│  │     │  │  │     └─ test
│  │     │  │  │        └─ test.js
│  │     │  │  ├─ package.json
│  │     │  │  └─ README.md
│  │     │  ├─ asynckit
│  │     │  │  ├─ bench.js
│  │     │  │  ├─ index.js
│  │     │  │  ├─ LICENSE
│  │     │  │  ├─ package.json
│  │     │  │  ├─ parallel.js
│  │     │  │  ├─ README.md
│  │     │  │  ├─ serial.js
│  │     │  │  ├─ serialOrdered.js
│  │     │  │  └─ stream.js
│  │     │  ├─ axios
│  │     │  │  ├─ CHANGELOG.md
│  │     │  │  ├─ index.d.cts
│  │     │  │  ├─ index.d.ts
│  │     │  │  ├─ index.js
│  │     │  │  ├─ LICENSE
│  │     │  │  ├─ MIGRATION_GUIDE.md
│  │     │  │  ├─ package.json
│  │     │  │  ├─ README.md
│  │     │  │  └─ SECURITY.md
│  │     │  ├─ balanced-match
│  │     │  │  ├─ .github
│  │     │  │  │  └─ FUNDING.yml
│  │     │  │  ├─ index.js
│  │     │  │  ├─ LICENSE.md
│  │     │  │  ├─ package.json
│  │     │  │  └─ README.md
│  │     │  ├─ base-64
│  │     │  │  ├─ base64.js
│  │     │  │  ├─ LICENSE-MIT.txt
│  │     │  │  ├─ package.json
│  │     │  │  └─ README.md
│  │     │  ├─ base64-js
│  │     │  │  ├─ base64js.min.js
│  │     │  │  ├─ index.d.ts
│  │     │  │  ├─ index.js
│  │     │  │  ├─ LICENSE
│  │     │  │  ├─ package.json
│  │     │  │  └─ README.md
│  │     │  ├─ big-integer
│  │     │  │  ├─ BigInteger.d.ts
│  │     │  │  ├─ BigInteger.js
│  │     │  │  ├─ BigInteger.min.js
│  │     │  │  ├─ bower.json
│  │     │  │  ├─ LICENSE
│  │     │  │  ├─ package.json
│  │     │  │  ├─ README.md
│  │     │  │  └─ tsconfig.json
│  │     │  ├─ binary
│  │     │  │  ├─ .npmignore
│  │     │  │  ├─ .travis.yml
│  │     │  │  ├─ example
│  │     │  │  │  ├─ buf.js
│  │     │  │  │  ├─ parse.js
│  │     │  │  │  └─ stream.js
│  │     │  │  ├─ index.js
│  │     │  │  ├─ package.json
│  │     │  │  ├─ perf
│  │     │  │  │  ├─ loop.js
│  │     │  │  │  └─ small.js
│  │     │  │  ├─ README.markdown
│  │     │  │  └─ test
│  │     │  │     ├─ bu.js
│  │     │  │     ├─ deferred.js
│  │     │  │     ├─ dots.js
│  │     │  │     ├─ eof.js
│  │     │  │     ├─ flush.js
│  │     │  │     ├─ from_buffer.js
│  │     │  │     ├─ get_buffer.js
│  │     │  │     ├─ immediate.js
│  │     │  │     ├─ interval.js
│  │     │  │     ├─ into_buffer.js
│  │     │  │     ├─ into_stream.js
│  │     │  │     ├─ loop.js
│  │     │  │     ├─ loop_scan.js
│  │     │  │     ├─ lu.js
│  │     │  │     ├─ negbs.js
│  │     │  │     ├─ negls.js
│  │     │  │     ├─ nested.js
│  │     │  │     ├─ not_enough_buf.js
│  │     │  │     ├─ not_enough_parse.js
│  │     │  │     ├─ parse.js
│  │     │  │     ├─ peek.js
│  │     │  │     ├─ pipe.js
│  │     │  │     ├─ posbs.js
│  │     │  │     ├─ posls.js
│  │     │  │     ├─ scan.js
│  │     │  │     ├─ scan_buf.js
│  │     │  │     ├─ scan_buf_null.js
│  │     │  │     ├─ skip.js
│  │     │  │     └─ split.js
│  │     │  ├─ bluebird
│  │     │  │  ├─ changelog.md
│  │     │  │  ├─ js
│  │     │  │  │  ├─ browser
│  │     │  │  │  │  ├─ bluebird.core.js
│  │     │  │  │  │  ├─ bluebird.core.min.js
│  │     │  │  │  │  ├─ bluebird.js
│  │     │  │  │  │  └─ bluebird.min.js
│  │     │  │  │  └─ release
│  │     │  │  │     ├─ any.js
│  │     │  │  │     ├─ assert.js
│  │     │  │  │     ├─ async.js
│  │     │  │  │     ├─ bind.js
│  │     │  │  │     ├─ bluebird.js
│  │     │  │  │     ├─ call_get.js
│  │     │  │  │     ├─ cancel.js
│  │     │  │  │     ├─ catch_filter.js
│  │     │  │  │     ├─ context.js
│  │     │  │  │     ├─ debuggability.js
│  │     │  │  │     ├─ direct_resolve.js
│  │     │  │  │     ├─ each.js
│  │     │  │  │     ├─ errors.js
│  │     │  │  │     ├─ es5.js
│  │     │  │  │     ├─ filter.js
│  │     │  │  │     ├─ finally.js
│  │     │  │  │     ├─ generators.js
│  │     │  │  │     ├─ join.js
│  │     │  │  │     ├─ map.js
│  │     │  │  │     ├─ method.js
│  │     │  │  │     ├─ nodeback.js
│  │     │  │  │     ├─ nodeify.js
│  │     │  │  │     ├─ promise.js
│  │     │  │  │     ├─ promise_array.js
│  │     │  │  │     ├─ promisify.js
│  │     │  │  │     ├─ props.js
│  │     │  │  │     ├─ queue.js
│  │     │  │  │     ├─ race.js
│  │     │  │  │     ├─ reduce.js
│  │     │  │  │     ├─ schedule.js
│  │     │  │  │     ├─ settle.js
│  │     │  │  │     ├─ some.js
│  │     │  │  │     ├─ synchronous_inspection.js
│  │     │  │  │     ├─ thenables.js
│  │     │  │  │     ├─ timers.js
│  │     │  │  │     ├─ using.js
│  │     │  │  │     └─ util.js
│  │     │  │  ├─ LICENSE
│  │     │  │  ├─ package.json
│  │     │  │  └─ README.md
│  │     │  ├─ boolean
│  │     │  │  ├─ .eslintrc.json
│  │     │  │  ├─ .npmpackagejsonlintrc.json
│  │     │  │  ├─ .releaserc.json
│  │     │  │  ├─ CHANGELOG.md
│  │     │  │  ├─ LICENSE.txt
│  │     │  │  ├─ licenseCheck.json
│  │     │  │  ├─ package.json
│  │     │  │  ├─ README.md
│  │     │  │  └─ tsconfig.json
│  │     │  ├─ brace-expansion
│  │     │  │  ├─ index.js
│  │     │  │  ├─ LICENSE
│  │     │  │  ├─ package.json
│  │     │  │  └─ README.md
│  │     │  ├─ buffer-crc32
│  │     │  │  ├─ index.js
│  │     │  │  ├─ LICENSE
│  │     │  │  ├─ package.json
│  │     │  │  └─ README.md
│  │     │  ├─ buffer-indexof-polyfill
│  │     │  │  ├─ .eslintrc
│  │     │  │  ├─ .travis.yml
│  │     │  │  ├─ index.js
│  │     │  │  ├─ init-buffer.js
│  │     │  │  ├─ LICENSE
│  │     │  │  ├─ package.json
│  │     │  │  ├─ README.md
│  │     │  │  └─ test
│  │     │  │     └─ indexof.js
│  │     │  ├─ buffers
│  │     │  │  ├─ examples
│  │     │  │  │  ├─ slice.js
│  │     │  │  │  └─ splice.js
│  │     │  │  ├─ index.js
│  │     │  │  ├─ package.json
│  │     │  │  ├─ README.markdown
│  │     │  │  └─ test
│  │     │  │     └─ buffers.js
│  │     │  ├─ cacheable-lookup
│  │     │  │  ├─ index.d.ts
│  │     │  │  ├─ LICENSE
│  │     │  │  ├─ package.json
│  │     │  │  ├─ README.md
│  │     │  │  └─ source
│  │     │  │     └─ index.js
│  │     │  ├─ cacheable-request
│  │     │  │  ├─ LICENSE
│  │     │  │  ├─ package.json
│  │     │  │  ├─ README.md
│  │     │  │  └─ src
│  │     │  │     └─ index.js
│  │     │  ├─ chainsaw
│  │     │  │  ├─ .npmignore
│  │     │  │  ├─ examples
│  │     │  │  │  ├─ add_do.js
│  │     │  │  │  └─ prompt.js
│  │     │  │  ├─ index.js
│  │     │  │  ├─ package.json
│  │     │  │  ├─ README.markdown
│  │     │  │  └─ test
│  │     │  │     └─ chainsaw.js
│  │     │  ├─ charenc
│  │     │  │  ├─ charenc.js
│  │     │  │  ├─ LICENSE.mkd
│  │     │  │  ├─ package.json
│  │     │  │  └─ README.js
│  │     │  ├─ clone-response
│  │     │  │  ├─ LICENSE
│  │     │  │  ├─ package.json
│  │     │  │  ├─ README.md
│  │     │  │  └─ src
│  │     │  │     └─ index.js
│  │     │  ├─ combined-stream
│  │     │  │  ├─ License
│  │     │  │  ├─ package.json
│  │     │  │  ├─ Readme.md
│  │     │  │  └─ yarn.lock
│  │     │  ├─ concat-map
│  │     │  │  ├─ .travis.yml
│  │     │  │  ├─ example
│  │     │  │  │  └─ map.js
│  │     │  │  ├─ index.js
│  │     │  │  ├─ LICENSE
│  │     │  │  ├─ package.json
│  │     │  │  ├─ README.markdown
│  │     │  │  └─ test
│  │     │  │     └─ map.js
│  │     │  ├─ core-util-is
│  │     │  │  ├─ LICENSE
│  │     │  │  ├─ package.json
│  │     │  │  └─ README.md
│  │     │  ├─ crypt
│  │     │  │  ├─ crypt.js
│  │     │  │  ├─ LICENSE.mkd
│  │     │  │  ├─ package.json
│  │     │  │  └─ README.mkd
│  │     │  ├─ debug
│  │     │  │  ├─ LICENSE
│  │     │  │  ├─ package.json
│  │     │  │  ├─ README.md
│  │     │  │  └─ src
│  │     │  │     ├─ browser.js
│  │     │  │     ├─ common.js
│  │     │  │     ├─ index.js
│  │     │  │     └─ node.js
│  │     │  ├─ decompress-response
│  │     │  │  ├─ index.d.ts
│  │     │  │  ├─ index.js
│  │     │  │  ├─ license
│  │     │  │  ├─ node_modules
│  │     │  │  │  └─ mimic-response
│  │     │  │  │     ├─ index.d.ts
│  │     │  │  │     ├─ index.js
│  │     │  │  │     ├─ license
│  │     │  │  │     ├─ package.json
│  │     │  │  │     └─ readme.md
│  │     │  │  ├─ package.json
│  │     │  │  └─ readme.md
│  │     │  ├─ defer-to-connect
│  │     │  │  ├─ LICENSE
│  │     │  │  ├─ package.json
│  │     │  │  └─ README.md
│  │     │  ├─ define-data-property
│  │     │  │  ├─ .eslintrc
│  │     │  │  ├─ .github
│  │     │  │  │  └─ FUNDING.yml
│  │     │  │  ├─ .nycrc
│  │     │  │  ├─ CHANGELOG.md
│  │     │  │  ├─ index.d.ts
│  │     │  │  ├─ index.d.ts.map
│  │     │  │  ├─ index.js
│  │     │  │  ├─ LICENSE
│  │     │  │  ├─ package.json
│  │     │  │  ├─ README.md
│  │     │  │  ├─ test
│  │     │  │  │  └─ index.js
│  │     │  │  └─ tsconfig.json
│  │     │  ├─ define-properties
│  │     │  │  ├─ .editorconfig
│  │     │  │  ├─ .eslintrc
│  │     │  │  ├─ .github
│  │     │  │  │  └─ FUNDING.yml
│  │     │  │  ├─ .nycrc
│  │     │  │  ├─ CHANGELOG.md
│  │     │  │  ├─ index.js
│  │     │  │  ├─ LICENSE
│  │     │  │  ├─ package.json
│  │     │  │  └─ README.md
│  │     │  ├─ delayed-stream
│  │     │  │  ├─ .npmignore
│  │     │  │  ├─ License
│  │     │  │  ├─ Makefile
│  │     │  │  ├─ package.json
│  │     │  │  └─ Readme.md
│  │     │  ├─ detect-node
│  │     │  │  ├─ browser.js
│  │     │  │  ├─ index.esm.js
│  │     │  │  ├─ index.js
│  │     │  │  ├─ LICENSE
│  │     │  │  ├─ package.json
│  │     │  │  └─ Readme.md
│  │     │  ├─ digest-fetch
│  │     │  │  ├─ .babelrc
│  │     │  │  ├─ .eslintrc
│  │     │  │  ├─ .npmignore
│  │     │  │  ├─ .travis.yml
│  │     │  │  ├─ digest-fetch-src.js
│  │     │  │  ├─ digest-fetch.js
│  │     │  │  ├─ LICENSE
│  │     │  │  ├─ package.json
│  │     │  │  ├─ README.md
│  │     │  │  ├─ test
│  │     │  │  │  ├─ digest-fetch-basic.js
│  │     │  │  │  ├─ digest-fetch-rfc2069.js
│  │     │  │  │  ├─ digest-fetch-rfc2617.js
│  │     │  │  │  ├─ digest-fetch.js
│  │     │  │  │  └─ test-server.js
│  │     │  │  └─ webpack.config.js
│  │     │  ├─ dingbat-to-unicode
│  │     │  │  ├─ package.json
│  │     │  │  └─ README.md
│  │     │  ├─ duck
│  │     │  │  ├─ index.js
│  │     │  │  ├─ LICENSE
│  │     │  │  ├─ makefile
│  │     │  │  ├─ package.json
│  │     │  │  ├─ README.md
│  │     │  │  └─ test
│  │     │  │     └─ duck.test.js
│  │     │  ├─ duplexer2
│  │     │  │  ├─ index.js
│  │     │  │  ├─ LICENSE.md
│  │     │  │  ├─ package.json
│  │     │  │  └─ README.md
│  │     │  ├─ electron
│  │     │  │  ├─ checksums.json
│  │     │  │  ├─ cli.js
│  │     │  │  ├─ electron.d.ts
│  │     │  │  ├─ index.js
│  │     │  │  ├─ install.js
│  │     │  │  ├─ LICENSE
│  │     │  │  ├─ package.json
│  │     │  │  ├─ path.txt
│  │     │  │  └─ README.md
│  │     │  ├─ end-of-stream
│  │     │  │  ├─ index.js
│  │     │  │  ├─ LICENSE
│  │     │  │  ├─ package.json
│  │     │  │  └─ README.md
│  │     │  ├─ env-paths
│  │     │  │  ├─ index.d.ts
│  │     │  │  ├─ index.js
│  │     │  │  ├─ license
│  │     │  │  ├─ package.json
│  │     │  │  └─ readme.md
│  │     │  ├─ es-errors
│  │     │  │  ├─ .eslintrc
│  │     │  │  ├─ .github
│  │     │  │  │  └─ FUNDING.yml
│  │     │  │  ├─ CHANGELOG.md
│  │     │  │  ├─ eval.d.ts
│  │     │  │  ├─ eval.js
│  │     │  │  ├─ index.d.ts
│  │     │  │  ├─ index.js
│  │     │  │  ├─ LICENSE
│  │     │  │  ├─ package.json
│  │     │  │  ├─ range.d.ts
│  │     │  │  ├─ range.js
│  │     │  │  ├─ README.md
│  │     │  │  ├─ ref.d.ts
│  │     │  │  ├─ ref.js
│  │     │  │  ├─ syntax.d.ts
│  │     │  │  ├─ syntax.js
│  │     │  │  ├─ test
│  │     │  │  │  └─ index.js
│  │     │  │  ├─ tsconfig.json
│  │     │  │  ├─ type.d.ts
│  │     │  │  ├─ type.js
│  │     │  │  ├─ uri.d.ts
│  │     │  │  └─ uri.js
│  │     │  ├─ es6-error
│  │     │  │  ├─ CHANGELOG.md
│  │     │  │  ├─ es6
│  │     │  │  │  └─ index.js
│  │     │  │  ├─ LICENSE.md
│  │     │  │  ├─ package.json
│  │     │  │  ├─ README.md
│  │     │  │  └─ typings
│  │     │  │     └─ index.d.ts
│  │     │  ├─ escape-string-regexp
│  │     │  │  ├─ index.d.ts
│  │     │  │  ├─ index.js
│  │     │  │  ├─ license
│  │     │  │  ├─ package.json
│  │     │  │  └─ readme.md
│  │     │  ├─ event-target-shim
│  │     │  │  ├─ index.d.ts
│  │     │  │  ├─ LICENSE
│  │     │  │  ├─ package.json
│  │     │  │  └─ README.md
│  │     │  ├─ extract-zip
│  │     │  │  ├─ cli.js
│  │     │  │  ├─ index.d.ts
│  │     │  │  ├─ index.js
│  │     │  │  ├─ LICENSE
│  │     │  │  ├─ package.json
│  │     │  │  └─ readme.md
│  │     │  ├─ fd-slicer
│  │     │  │  ├─ .npmignore
│  │     │  │  ├─ .travis.yml
│  │     │  │  ├─ CHANGELOG.md
│  │     │  │  ├─ index.js
│  │     │  │  ├─ LICENSE
│  │     │  │  ├─ package.json
│  │     │  │  ├─ README.md
│  │     │  │  └─ test
│  │     │  │     └─ test.js
│  │     │  ├─ follow-redirects
│  │     │  │  ├─ debug.js
│  │     │  │  ├─ http.js
│  │     │  │  ├─ https.js
│  │     │  │  ├─ index.js
│  │     │  │  ├─ LICENSE
│  │     │  │  ├─ package.json
│  │     │  │  └─ README.md
│  │     │  ├─ form-data
│  │     │  │  ├─ index.d.ts
│  │     │  │  ├─ License
│  │     │  │  ├─ package.json
│  │     │  │  ├─ Readme.md
│  │     │  │  └─ README.md.bak
│  │     │  ├─ form-data-encoder
│  │     │  │  ├─ @type
│  │     │  │  │  ├─ FileLike.d.ts
│  │     │  │  │  ├─ FormDataEncoder.d.ts
│  │     │  │  │  ├─ FormDataLike.d.ts
│  │     │  │  │  ├─ index.d.ts
│  │     │  │  │  └─ util
│  │     │  │  │     ├─ createBoundary.d.ts
│  │     │  │  │     ├─ escapeName.d.ts
│  │     │  │  │     ├─ isFileLike.d.ts
│  │     │  │  │     ├─ isFormData.d.ts
│  │     │  │  │     ├─ isFunction.d.ts
│  │     │  │  │     ├─ isPlainObject.d.ts
│  │     │  │  │     └─ normalizeValue.d.ts
│  │     │  │  ├─ license
│  │     │  │  ├─ package.json
│  │     │  │  └─ readme.md
│  │     │  ├─ formdata-node
│  │     │  │  ├─ @type
│  │     │  │  │  ├─ Blob.d.ts
│  │     │  │  │  ├─ blobHelpers.d.ts
│  │     │  │  │  ├─ BlobPart.d.ts
│  │     │  │  │  ├─ browser.d.ts
│  │     │  │  │  ├─ deprecateConstructorEntries.d.ts
│  │     │  │  │  ├─ File.d.ts
│  │     │  │  │  ├─ fileFromPath.d.ts
│  │     │  │  │  ├─ FormData.d.ts
│  │     │  │  │  ├─ index.d.ts
│  │     │  │  │  ├─ isBlob.d.ts
│  │     │  │  │  ├─ isFile.d.ts
│  │     │  │  │  ├─ isFunction.d.ts
│  │     │  │  │  └─ isPlainObject.d.ts
│  │     │  │  ├─ license
│  │     │  │  ├─ node_modules
│  │     │  │  │  └─ web-streams-polyfill
│  │     │  │  │     ├─ es5
│  │     │  │  │     │  └─ package.json
│  │     │  │  │     ├─ LICENSE
│  │     │  │  │     ├─ package.json
│  │     │  │  │     ├─ polyfill
│  │     │  │  │     │  ├─ es5
│  │     │  │  │     │  │  └─ package.json
│  │     │  │  │     │  └─ package.json
│  │     │  │  │     ├─ README.md
│  │     │  │  │     └─ types
│  │     │  │  │        ├─ polyfill.d.ts
│  │     │  │  │        ├─ ponyfill.d.ts
│  │     │  │  │        └─ tsdoc-metadata.json
│  │     │  │  ├─ package.json
│  │     │  │  └─ readme.md
│  │     │  ├─ fs-extra
│  │     │  │  ├─ CHANGELOG.md
│  │     │  │  ├─ LICENSE
│  │     │  │  ├─ package.json
│  │     │  │  └─ README.md
│  │     │  ├─ fs.realpath
│  │     │  │  ├─ index.js
│  │     │  │  ├─ LICENSE
│  │     │  │  ├─ old.js
│  │     │  │  ├─ package.json
│  │     │  │  └─ README.md
│  │     │  ├─ fstream
│  │     │  │  ├─ .travis.yml
│  │     │  │  ├─ examples
│  │     │  │  │  ├─ filter-pipe.js
│  │     │  │  │  ├─ pipe.js
│  │     │  │  │  ├─ reader.js
│  │     │  │  │  └─ symlink-write.js
│  │     │  │  ├─ fstream.js
│  │     │  │  ├─ LICENSE
│  │     │  │  ├─ package.json
│  │     │  │  └─ README.md
│  │     │  ├─ function-bind
│  │     │  │  ├─ .eslintrc
│  │     │  │  ├─ .github
│  │     │  │  │  ├─ FUNDING.yml
│  │     │  │  │  └─ SECURITY.md
│  │     │  │  ├─ .nycrc
│  │     │  │  ├─ CHANGELOG.md
│  │     │  │  ├─ implementation.js
│  │     │  │  ├─ index.js
│  │     │  │  ├─ LICENSE
│  │     │  │  ├─ package.json
│  │     │  │  ├─ README.md
│  │     │  │  └─ test
│  │     │  │     ├─ .eslintrc
│  │     │  │     └─ index.js
│  │     │  ├─ get-intrinsic
│  │     │  │  ├─ .eslintrc
│  │     │  │  ├─ .github
│  │     │  │  │  └─ FUNDING.yml
│  │     │  │  ├─ .nycrc
│  │     │  │  ├─ CHANGELOG.md
│  │     │  │  ├─ index.js
│  │     │  │  ├─ LICENSE
│  │     │  │  ├─ package.json
│  │     │  │  ├─ README.md
│  │     │  │  └─ test
│  │     │  │     └─ GetIntrinsic.js
│  │     │  ├─ get-stream
│  │     │  │  ├─ buffer-stream.js
│  │     │  │  ├─ index.d.ts
│  │     │  │  ├─ index.js
│  │     │  │  ├─ license
│  │     │  │  ├─ package.json
│  │     │  │  └─ readme.md
│  │     │  ├─ glob
│  │     │  │  ├─ common.js
│  │     │  │  ├─ glob.js
│  │     │  │  ├─ LICENSE
│  │     │  │  ├─ package.json
│  │     │  │  ├─ README.md
│  │     │  │  └─ sync.js
│  │     │  ├─ global-agent
│  │     │  │  ├─ .flowconfig
│  │     │  │  ├─ bootstrap.js
│  │     │  │  ├─ LICENSE
│  │     │  │  ├─ node_modules
│  │     │  │  │  ├─ .bin
│  │     │  │  │  │  ├─ semver
│  │     │  │  │  │  ├─ semver.cmd
│  │     │  │  │  │  └─ semver.ps1
│  │     │  │  │  └─ semver
│  │     │  │  │     ├─ bin
│  │     │  │  │     │  └─ semver.js
│  │     │  │  │     ├─ classes
│  │     │  │  │     │  ├─ comparator.js
│  │     │  │  │     │  ├─ index.js
│  │     │  │  │     │  ├─ range.js
│  │     │  │  │     │  └─ semver.js
│  │     │  │  │     ├─ functions
│  │     │  │  │     │  ├─ clean.js
│  │     │  │  │     │  ├─ cmp.js
│  │     │  │  │     │  ├─ coerce.js
│  │     │  │  │     │  ├─ compare-build.js
│  │     │  │  │     │  ├─ compare-loose.js
│  │     │  │  │     │  ├─ compare.js
│  │     │  │  │     │  ├─ diff.js
│  │     │  │  │     │  ├─ eq.js
│  │     │  │  │     │  ├─ gt.js
│  │     │  │  │     │  ├─ gte.js
│  │     │  │  │     │  ├─ inc.js
│  │     │  │  │     │  ├─ lt.js
│  │     │  │  │     │  ├─ lte.js
│  │     │  │  │     │  ├─ major.js
│  │     │  │  │     │  ├─ minor.js
│  │     │  │  │     │  ├─ neq.js
│  │     │  │  │     │  ├─ parse.js
│  │     │  │  │     │  ├─ patch.js
│  │     │  │  │     │  ├─ prerelease.js
│  │     │  │  │     │  ├─ rcompare.js
│  │     │  │  │     │  ├─ rsort.js
│  │     │  │  │     │  ├─ satisfies.js
│  │     │  │  │     │  ├─ sort.js
│  │     │  │  │     │  └─ valid.js
│  │     │  │  │     ├─ index.js
│  │     │  │  │     ├─ internal
│  │     │  │  │     │  ├─ constants.js
│  │     │  │  │     │  ├─ debug.js
│  │     │  │  │     │  ├─ identifiers.js
│  │     │  │  │     │  ├─ parse-options.js
│  │     │  │  │     │  └─ re.js
│  │     │  │  │     ├─ LICENSE
│  │     │  │  │     ├─ package.json
│  │     │  │  │     ├─ preload.js
│  │     │  │  │     ├─ range.bnf
│  │     │  │  │     ├─ ranges
│  │     │  │  │     │  ├─ gtr.js
│  │     │  │  │     │  ├─ intersects.js
│  │     │  │  │     │  ├─ ltr.js
│  │     │  │  │     │  ├─ max-satisfying.js
│  │     │  │  │     │  ├─ min-satisfying.js
│  │     │  │  │     │  ├─ min-version.js
│  │     │  │  │     │  ├─ outside.js
│  │     │  │  │     │  ├─ simplify.js
│  │     │  │  │     │  ├─ subset.js
│  │     │  │  │     │  ├─ to-comparators.js
│  │     │  │  │     │  └─ valid.js
│  │     │  │  │     └─ README.md
│  │     │  │  ├─ package.json
│  │     │  │  ├─ README.md
│  │     │  │  └─ src
│  │     │  │     ├─ classes
│  │     │  │     │  ├─ Agent.js
│  │     │  │     │  ├─ HttpProxyAgent.js
│  │     │  │     │  ├─ HttpsProxyAgent.js
│  │     │  │     │  └─ index.js
│  │     │  │     ├─ errors.js
│  │     │  │     ├─ factories
│  │     │  │     │  ├─ createGlobalProxyAgent.js
│  │     │  │     │  ├─ createProxyController.js
│  │     │  │     │  └─ index.js
│  │     │  │     ├─ index.js
│  │     │  │     ├─ Logger.js
│  │     │  │     ├─ routines
│  │     │  │     │  ├─ bootstrap.js
│  │     │  │     │  └─ index.js
│  │     │  │     ├─ types.js
│  │     │  │     └─ utilities
│  │     │  │        ├─ bindHttpMethod.js
│  │     │  │        ├─ index.js
│  │     │  │        ├─ isUrlMatchingNoProxy.js
│  │     │  │        └─ parseProxyUrl.js
│  │     │  ├─ globalthis
│  │     │  │  ├─ .eslintrc
│  │     │  │  ├─ .nycrc
│  │     │  │  ├─ auto.js
│  │     │  │  ├─ CHANGELOG.md
│  │     │  │  ├─ implementation.browser.js
│  │     │  │  ├─ implementation.js
│  │     │  │  ├─ index.js
│  │     │  │  ├─ LICENSE
│  │     │  │  ├─ package.json
│  │     │  │  ├─ polyfill.js
│  │     │  │  ├─ README.md
│  │     │  │  ├─ shim.js
│  │     │  │  └─ test
│  │     │  │     ├─ implementation.js
│  │     │  │     ├─ index.js
│  │     │  │     ├─ native.js
│  │     │  │     ├─ shimmed.js
│  │     │  │     └─ tests.js
│  │     │  ├─ gopd
│  │     │  │  ├─ .eslintrc
│  │     │  │  ├─ .github
│  │     │  │  │  └─ FUNDING.yml
│  │     │  │  ├─ CHANGELOG.md
│  │     │  │  ├─ index.js
│  │     │  │  ├─ LICENSE
│  │     │  │  ├─ package.json
│  │     │  │  ├─ README.md
│  │     │  │  └─ test
│  │     │  │     └─ index.js
│  │     │  ├─ got
│  │     │  │  ├─ license
│  │     │  │  ├─ package.json
│  │     │  │  └─ readme.md
│  │     │  ├─ graceful-fs
│  │     │  │  ├─ clone.js
│  │     │  │  ├─ graceful-fs.js
│  │     │  │  ├─ legacy-streams.js
│  │     │  │  ├─ LICENSE
│  │     │  │  ├─ package.json
│  │     │  │  ├─ polyfills.js
│  │     │  │  └─ README.md
│  │     │  ├─ has-property-descriptors
│  │     │  │  ├─ .eslintrc
│  │     │  │  ├─ .github
│  │     │  │  │  └─ FUNDING.yml
│  │     │  │  ├─ .nycrc
│  │     │  │  ├─ CHANGELOG.md
│  │     │  │  ├─ index.js
│  │     │  │  ├─ LICENSE
│  │     │  │  ├─ package.json
│  │     │  │  ├─ README.md
│  │     │  │  └─ test
│  │     │  │     └─ index.js
│  │     │  ├─ has-proto
│  │     │  │  ├─ .eslintrc
│  │     │  │  ├─ .github
│  │     │  │  │  └─ FUNDING.yml
│  │     │  │  ├─ CHANGELOG.md
│  │     │  │  ├─ index.js
│  │     │  │  ├─ LICENSE
│  │     │  │  ├─ package.json
│  │     │  │  ├─ README.md
│  │     │  │  └─ test
│  │     │  │     └─ index.js
│  │     │  ├─ has-symbols
│  │     │  │  ├─ .eslintrc
│  │     │  │  ├─ .github
│  │     │  │  │  └─ FUNDING.yml
│  │     │  │  ├─ .nycrc
│  │     │  │  ├─ CHANGELOG.md
│  │     │  │  ├─ index.js
│  │     │  │  ├─ LICENSE
│  │     │  │  ├─ package.json
│  │     │  │  ├─ README.md
│  │     │  │  ├─ shams.js
│  │     │  │  └─ test
│  │     │  │     ├─ index.js
│  │     │  │     ├─ shams
│  │     │  │     │  ├─ core-js.js
│  │     │  │     │  └─ get-own-property-symbols.js
│  │     │  │     └─ tests.js
│  │     │  ├─ hasown
│  │     │  │  ├─ .eslintrc
│  │     │  │  ├─ .github
│  │     │  │  │  └─ FUNDING.yml
│  │     │  │  ├─ .nycrc
│  │     │  │  ├─ CHANGELOG.md
│  │     │  │  ├─ index.d.ts
│  │     │  │  ├─ index.d.ts.map
│  │     │  │  ├─ index.js
│  │     │  │  ├─ LICENSE
│  │     │  │  ├─ package.json
│  │     │  │  ├─ README.md
│  │     │  │  └─ tsconfig.json
│  │     │  ├─ http-cache-semantics
│  │     │  │  ├─ index.js
│  │     │  │  ├─ LICENSE
│  │     │  │  ├─ package.json
│  │     │  │  └─ README.md
│  │     │  ├─ http2-wrapper
│  │     │  │  ├─ LICENSE
│  │     │  │  ├─ package.json
│  │     │  │  ├─ README.md
│  │     │  │  └─ source
│  │     │  │     ├─ agent.js
│  │     │  │     ├─ auto.js
│  │     │  │     ├─ client-request.js
│  │     │  │     ├─ incoming-message.js
│  │     │  │     ├─ index.js
│  │     │  │     └─ utils
│  │     │  │        ├─ calculate-server-name.js
│  │     │  │        ├─ errors.js
│  │     │  │        ├─ is-request-pseudo-header.js
│  │     │  │        ├─ proxy-events.js
│  │     │  │        └─ url-to-options.js
│  │     │  ├─ humanize-ms
│  │     │  │  ├─ History.md
│  │     │  │  ├─ index.js
│  │     │  │  ├─ LICENSE
│  │     │  │  ├─ package.json
│  │     │  │  └─ README.md
│  │     │  ├─ immediate
│  │     │  │  ├─ LICENSE.txt
│  │     │  │  ├─ package.json
│  │     │  │  └─ README.md
│  │     │  ├─ inflight
│  │     │  │  ├─ inflight.js
│  │     │  │  ├─ LICENSE
│  │     │  │  ├─ package.json
│  │     │  │  └─ README.md
│  │     │  ├─ inherits
│  │     │  │  ├─ inherits.js
│  │     │  │  ├─ inherits_browser.js
│  │     │  │  ├─ LICENSE
│  │     │  │  ├─ package.json
│  │     │  │  └─ README.md
│  │     │  ├─ is-buffer
│  │     │  │  ├─ index.js
│  │     │  │  ├─ LICENSE
│  │     │  │  ├─ package.json
│  │     │  │  ├─ README.md
│  │     │  │  └─ test
│  │     │  │     └─ basic.js
│  │     │  ├─ isarray
│  │     │  │  ├─ .npmignore
│  │     │  │  ├─ .travis.yml
│  │     │  │  ├─ component.json
│  │     │  │  ├─ index.js
│  │     │  │  ├─ Makefile
│  │     │  │  ├─ package.json
│  │     │  │  ├─ README.md
│  │     │  │  └─ test.js
│  │     │  ├─ json-buffer
│  │     │  │  ├─ .travis.yml
│  │     │  │  ├─ index.js
│  │     │  │  ├─ LICENSE
│  │     │  │  ├─ package.json
│  │     │  │  ├─ README.md
│  │     │  │  └─ test
│  │     │  │     └─ index.js
│  │     │  ├─ json-stringify-safe
│  │     │  │  ├─ .npmignore
│  │     │  │  ├─ CHANGELOG.md
│  │     │  │  ├─ LICENSE
│  │     │  │  ├─ Makefile
│  │     │  │  ├─ package.json
│  │     │  │  ├─ README.md
│  │     │  │  ├─ stringify.js
│  │     │  │  └─ test
│  │     │  │     ├─ mocha.opts
│  │     │  │     └─ stringify_test.js
│  │     │  ├─ jsonfile
│  │     │  │  ├─ CHANGELOG.md
│  │     │  │  ├─ index.js
│  │     │  │  ├─ LICENSE
│  │     │  │  ├─ package.json
│  │     │  │  └─ README.md
│  │     │  ├─ jszip
│  │     │  │  ├─ .codeclimate.yml
│  │     │  │  ├─ .editorconfig
│  │     │  │  ├─ .eslintrc.js
│  │     │  │  ├─ .github
│  │     │  │  │  └─ workflows
│  │     │  │  │     └─ pr.yaml
│  │     │  │  ├─ .jekyll-metadata
│  │     │  │  ├─ .travis.yml
│  │     │  │  ├─ CHANGES.md
│  │     │  │  ├─ deps.js
│  │     │  │  ├─ graph.svg
│  │     │  │  ├─ index.d.ts
│  │     │  │  ├─ LICENSE.markdown
│  │     │  │  ├─ package.json
│  │     │  │  ├─ README.markdown
│  │     │  │  ├─ sponsors.md
│  │     │  │  ├─ tsconfig.json
│  │     │  │  └─ vendor
│  │     │  │     └─ FileSaver.js
│  │     │  ├─ keyv
│  │     │  │  ├─ package.json
│  │     │  │  ├─ README.md
│  │     │  │  └─ src
│  │     │  │     ├─ index.d.ts
│  │     │  │     └─ index.js
│  │     │  ├─ lie
│  │     │  │  ├─ license.md
│  │     │  │  ├─ lie.d.ts
│  │     │  │  ├─ package.json
│  │     │  │  ├─ polyfill.js
│  │     │  │  └─ README.md
│  │     │  ├─ listenercount
│  │     │  │  ├─ .npmignore
│  │     │  │  ├─ circle.yml
│  │     │  │  ├─ index.js
│  │     │  │  ├─ LICENSE.md
│  │     │  │  ├─ package.json
│  │     │  │  ├─ README.md
│  │     │  │  └─ test
│  │     │  │     └─ test.js
│  │     │  ├─ lop
│  │     │  │  ├─ index.js
│  │     │  │  ├─ LICENSE
│  │     │  │  ├─ makefile
│  │     │  │  ├─ package.json
│  │     │  │  ├─ README.md
│  │     │  │  └─ test
│  │     │  │     ├─ bottom-up.test.js
│  │     │  │     ├─ errors.test.js
│  │     │  │     ├─ lazy-iterators.test.js
│  │     │  │     ├─ lop.test.js
│  │     │  │     ├─ regex-tokeniser.test.js
│  │     │  │     ├─ results.test.js
│  │     │  │     ├─ rules.test.js
│  │     │  │     ├─ StringSource.test.js
│  │     │  │     ├─ Tokeniser.js
│  │     │  │     ├─ Tokeniser.test.js
│  │     │  │     └─ TokenIterator.test.js
│  │     │  ├─ lowercase-keys
│  │     │  │  ├─ index.d.ts
│  │     │  │  ├─ index.js
│  │     │  │  ├─ license
│  │     │  │  ├─ package.json
│  │     │  │  └─ readme.md
│  │     │  ├─ lru-cache
│  │     │  │  ├─ index.js
│  │     │  │  ├─ LICENSE
│  │     │  │  ├─ package.json
│  │     │  │  └─ README.md
│  │     │  ├─ mammoth
│  │     │  │  ├─ .eslintrc.json
│  │     │  │  ├─ .github
│  │     │  │  │  ├─ ISSUE_TEMPLATE.md
│  │     │  │  │  ├─ pull_request_template.md
│  │     │  │  │  └─ workflows
│  │     │  │  │     └─ tests.yml
│  │     │  │  ├─ bin
│  │     │  │  │  └─ mammoth
│  │     │  │  ├─ browser
│  │     │  │  │  ├─ docx
│  │     │  │  │  │  └─ files.js
│  │     │  │  │  └─ unzip.js
│  │     │  │  ├─ LICENSE
│  │     │  │  ├─ mammoth.browser.js
│  │     │  │  ├─ mammoth.browser.min.js
│  │     │  │  ├─ NEWS
│  │     │  │  ├─ package.json
│  │     │  │  ├─ README.md
│  │     │  │  └─ test
│  │     │  │     ├─ .eslintrc.json
│  │     │  │     ├─ document-to-html.tests.js
│  │     │  │     ├─ docx
│  │     │  │     │  ├─ body-reader.tests.js
│  │     │  │     │  ├─ comments-reader.tests.js
│  │     │  │     │  ├─ content-types-reader.tests.js
│  │     │  │     │  ├─ document-matchers.js
│  │     │  │     │  ├─ docx-reader.tests.js
│  │     │  │     │  ├─ files.tests.js
│  │     │  │     │  ├─ notes-reader.tests.js
│  │     │  │     │  ├─ numbering-xml.tests.js
│  │     │  │     │  ├─ office-xml-reader.tests.js
│  │     │  │     │  ├─ relationships-reader.tests.js
│  │     │  │     │  ├─ style-map.tests.js
│  │     │  │     │  ├─ styles-reader.tests.js
│  │     │  │     │  └─ uris.tests.js
│  │     │  │     ├─ html
│  │     │  │     │  ├─ simplify.tests.js
│  │     │  │     │  └─ write.tests.js
│  │     │  │     ├─ images.tests.js
│  │     │  │     ├─ main.tests.js
│  │     │  │     ├─ mammoth.tests.js
│  │     │  │     ├─ mocha.opts
│  │     │  │     ├─ options-reader.tests.js
│  │     │  │     ├─ raw-text.tests.js
│  │     │  │     ├─ results.tests.js
│  │     │  │     ├─ style-reader.tests.js
│  │     │  │     ├─ styles
│  │     │  │     │  ├─ document-matchers.tests.js
│  │     │  │     │  ├─ html-paths.tests.js
│  │     │  │     │  └─ parser
│  │     │  │     │     └─ tokeniser.tests.js
│  │     │  │     ├─ test-data
│  │     │  │     │  ├─ comments.docx
│  │     │  │     │  ├─ embedded-style-map.docx
│  │     │  │     │  ├─ empty.docx
│  │     │  │     │  ├─ empty.zip
│  │     │  │     │  ├─ endnotes.docx
│  │     │  │     │  ├─ external-picture.docx
│  │     │  │     │  ├─ footnote-hyperlink.docx
│  │     │  │     │  ├─ footnotes.docx
│  │     │  │     │  ├─ hello.zip
│  │     │  │     │  ├─ hyperlinks
│  │     │  │     │  │  └─ word
│  │     │  │     │  │     ├─ document.xml
│  │     │  │     │  │     └─ _rels
│  │     │  │     │  │        └─ document.xml.rels
│  │     │  │     │  ├─ simple
│  │     │  │     │  │  └─ word
│  │     │  │     │  │     └─ document.xml
│  │     │  │     │  ├─ simple-list.docx
│  │     │  │     │  ├─ single-paragraph.docx
│  │     │  │     │  ├─ strikethrough.docx
│  │     │  │     │  ├─ tables.docx
│  │     │  │     │  ├─ text-box.docx
│  │     │  │     │  ├─ tiny-picture-target-base-relative.docx
│  │     │  │     │  ├─ tiny-picture.docx
│  │     │  │     │  ├─ tiny-picture.png
│  │     │  │     │  ├─ underline.docx
│  │     │  │     │  └─ utf8-bom.docx
│  │     │  │     ├─ test.js
│  │     │  │     ├─ testing.js
│  │     │  │     ├─ transforms.tests.js
│  │     │  │     ├─ unzip.tests.js
│  │     │  │     ├─ writers
│  │     │  │     │  ├─ html-writer.tests.js
│  │     │  │     │  └─ markdown-writer.tests.js
│  │     │  │     ├─ xml
│  │     │  │     │  ├─ reader.tests.js
│  │     │  │     │  └─ writer.tests.js
│  │     │  │     └─ zipfile.tests.js
│  │     │  ├─ matcher
│  │     │  │  ├─ index.d.ts
│  │     │  │  ├─ index.js
│  │     │  │  ├─ license
│  │     │  │  ├─ package.json
│  │     │  │  └─ readme.md
│  │     │  ├─ md5
│  │     │  │  ├─ .travis.yml
│  │     │  │  ├─ demo
│  │     │  │  │  └─ index.html
│  │     │  │  ├─ LICENSE
│  │     │  │  ├─ md5.js
│  │     │  │  ├─ package.json
│  │     │  │  ├─ README.md
│  │     │  │  ├─ test.js
│  │     │  │  └─ webpack.config.js
│  │     │  ├─ mime-db
│  │     │  │  ├─ db.json
│  │     │  │  ├─ HISTORY.md
│  │     │  │  ├─ index.js
│  │     │  │  ├─ LICENSE
│  │     │  │  ├─ package.json
│  │     │  │  └─ README.md
│  │     │  ├─ mime-types
│  │     │  │  ├─ HISTORY.md
│  │     │  │  ├─ index.js
│  │     │  │  ├─ LICENSE
│  │     │  │  ├─ package.json
│  │     │  │  └─ README.md
│  │     │  ├─ mimic-response
│  │     │  │  ├─ index.js
│  │     │  │  ├─ license
│  │     │  │  ├─ package.json
│  │     │  │  └─ readme.md
│  │     │  ├─ minimatch
│  │     │  │  ├─ LICENSE
│  │     │  │  ├─ minimatch.js
│  │     │  │  ├─ package.json
│  │     │  │  └─ README.md
│  │     │  ├─ minimist
│  │     │  │  ├─ .eslintrc
│  │     │  │  ├─ .github
│  │     │  │  │  └─ FUNDING.yml
│  │     │  │  ├─ .nycrc
│  │     │  │  ├─ CHANGELOG.md
│  │     │  │  ├─ example
│  │     │  │  │  └─ parse.js
│  │     │  │  ├─ index.js
│  │     │  │  ├─ LICENSE
│  │     │  │  ├─ package.json
│  │     │  │  ├─ README.md
│  │     │  │  └─ test
│  │     │  │     ├─ all_bool.js
│  │     │  │     ├─ bool.js
│  │     │  │     ├─ dash.js
│  │     │  │     ├─ default_bool.js
│  │     │  │     ├─ dotted.js
│  │     │  │     ├─ kv_short.js
│  │     │  │     ├─ long.js
│  │     │  │     ├─ num.js
│  │     │  │     ├─ parse.js
│  │     │  │     ├─ parse_modified.js
│  │     │  │     ├─ proto.js
│  │     │  │     ├─ short.js
│  │     │  │     ├─ stop_early.js
│  │     │  │     ├─ unknown.js
│  │     │  │     └─ whitespace.js
│  │     │  ├─ mkdirp
│  │     │  │  ├─ bin
│  │     │  │  │  ├─ cmd.js
│  │     │  │  │  └─ usage.txt
│  │     │  │  ├─ index.js
│  │     │  │  ├─ LICENSE
│  │     │  │  ├─ package.json
│  │     │  │  └─ readme.markdown
│  │     │  ├─ ms
│  │     │  │  ├─ index.js
│  │     │  │  ├─ license.md
│  │     │  │  ├─ package.json
│  │     │  │  └─ readme.md
│  │     │  ├─ node-domexception
│  │     │  │  ├─ .history
│  │     │  │  │  ├─ index_20210527203842.js
│  │     │  │  │  ├─ index_20210527203947.js
│  │     │  │  │  ├─ index_20210527204259.js
│  │     │  │  │  ├─ index_20210527204418.js
│  │     │  │  │  ├─ index_20210527204756.js
│  │     │  │  │  ├─ index_20210527204833.js
│  │     │  │  │  ├─ index_20210527211208.js
│  │     │  │  │  ├─ index_20210527211248.js
│  │     │  │  │  ├─ index_20210527212722.js
│  │     │  │  │  ├─ index_20210527212731.js
│  │     │  │  │  ├─ index_20210527212746.js
│  │     │  │  │  ├─ index_20210527212900.js
│  │     │  │  │  ├─ index_20210527213022.js
│  │     │  │  │  ├─ index_20210527213822.js
│  │     │  │  │  ├─ index_20210527213843.js
│  │     │  │  │  ├─ index_20210527213852.js
│  │     │  │  │  ├─ index_20210527213910.js
│  │     │  │  │  ├─ index_20210527214034.js
│  │     │  │  │  ├─ index_20210527214643.js
│  │     │  │  │  ├─ index_20210527214654.js
│  │     │  │  │  ├─ index_20210527214700.js
│  │     │  │  │  ├─ package_20210527203733.json
│  │     │  │  │  ├─ package_20210527203825.json
│  │     │  │  │  ├─ package_20210527204621.json
│  │     │  │  │  ├─ package_20210527204913.json
│  │     │  │  │  ├─ package_20210527204925.json
│  │     │  │  │  ├─ package_20210527205145.json
│  │     │  │  │  ├─ package_20210527205156.json
│  │     │  │  │  ├─ README_20210527203617.md
│  │     │  │  │  ├─ README_20210527212714.md
│  │     │  │  │  ├─ README_20210527213345.md
│  │     │  │  │  ├─ README_20210527213411.md
│  │     │  │  │  ├─ README_20210527213803.md
│  │     │  │  │  ├─ README_20210527214323.md
│  │     │  │  │  ├─ README_20210527214408.md
│  │     │  │  │  ├─ test_20210527205603.js
│  │     │  │  │  ├─ test_20210527205957.js
│  │     │  │  │  └─ test_20210527210021.js
│  │     │  │  ├─ index.js
│  │     │  │  ├─ LICENSE
│  │     │  │  ├─ package.json
│  │     │  │  └─ README.md
│  │     │  ├─ node-ensure
│  │     │  │  ├─ .npmignore
│  │     │  │  ├─ browser.js
│  │     │  │  ├─ index.js
│  │     │  │  ├─ package.json
│  │     │  │  └─ README.md
│  │     │  ├─ node-fetch
│  │     │  │  ├─ browser.js
│  │     │  │  ├─ LICENSE.md
│  │     │  │  ├─ package.json
│  │     │  │  └─ README.md
│  │     │  ├─ normalize-url
│  │     │  │  ├─ index.d.ts
│  │     │  │  ├─ index.js
│  │     │  │  ├─ license
│  │     │  │  ├─ package.json
│  │     │  │  └─ readme.md
│  │     │  ├─ object-keys
│  │     │  │  ├─ .editorconfig
│  │     │  │  ├─ .eslintrc
│  │     │  │  ├─ .travis.yml
│  │     │  │  ├─ CHANGELOG.md
│  │     │  │  ├─ implementation.js
│  │     │  │  ├─ index.js
│  │     │  │  ├─ isArguments.js
│  │     │  │  ├─ LICENSE
│  │     │  │  ├─ package.json
│  │     │  │  ├─ README.md
│  │     │  │  └─ test
│  │     │  │     └─ index.js
│  │     │  ├─ once
│  │     │  │  ├─ LICENSE
│  │     │  │  ├─ once.js
│  │     │  │  ├─ package.json
│  │     │  │  └─ README.md
│  │     │  ├─ openai
│  │     │  │  ├─ bin
│  │     │  │  │  └─ cli
│  │     │  │  ├─ CHANGELOG.md
│  │     │  │  ├─ core.d.ts
│  │     │  │  ├─ core.d.ts.map
│  │     │  │  ├─ core.js
│  │     │  │  ├─ core.js.map
│  │     │  │  ├─ core.mjs
│  │     │  │  ├─ core.mjs.map
│  │     │  │  ├─ error.d.ts
│  │     │  │  ├─ error.d.ts.map
│  │     │  │  ├─ error.js
│  │     │  │  ├─ error.js.map
│  │     │  │  ├─ error.mjs
│  │     │  │  ├─ error.mjs.map
│  │     │  │  ├─ index.d.mts
│  │     │  │  ├─ index.d.ts
│  │     │  │  ├─ index.d.ts.map
│  │     │  │  ├─ index.js
│  │     │  │  ├─ index.js.map
│  │     │  │  ├─ index.mjs
│  │     │  │  ├─ index.mjs.map
│  │     │  │  ├─ LICENSE
│  │     │  │  ├─ node_modules
│  │     │  │  │  └─ node-fetch
│  │     │  │  │     ├─ browser.js
│  │     │  │  │     ├─ LICENSE.md
│  │     │  │  │     ├─ package.json
│  │     │  │  │     └─ README.md
│  │     │  │  ├─ package.json
│  │     │  │  ├─ pagination.d.ts
│  │     │  │  ├─ pagination.d.ts.map
│  │     │  │  ├─ pagination.js
│  │     │  │  ├─ pagination.js.map
│  │     │  │  ├─ pagination.mjs
│  │     │  │  ├─ pagination.mjs.map
│  │     │  │  ├─ README.md
│  │     │  │  ├─ resource.d.ts
│  │     │  │  ├─ resource.d.ts.map
│  │     │  │  ├─ resource.js
│  │     │  │  ├─ resource.js.map
│  │     │  │  ├─ resource.mjs
│  │     │  │  ├─ resource.mjs.map
│  │     │  │  ├─ resources
│  │     │  │  │  ├─ audio
│  │     │  │  │  │  ├─ audio.d.ts
│  │     │  │  │  │  ├─ audio.d.ts.map
│  │     │  │  │  │  ├─ audio.js
│  │     │  │  │  │  ├─ audio.js.map
│  │     │  │  │  │  ├─ audio.mjs
│  │     │  │  │  │  ├─ audio.mjs.map
│  │     │  │  │  │  ├─ index.d.ts
│  │     │  │  │  │  ├─ index.d.ts.map
│  │     │  │  │  │  ├─ index.js
│  │     │  │  │  │  ├─ index.js.map
│  │     │  │  │  │  ├─ index.mjs
│  │     │  │  │  │  ├─ index.mjs.map
│  │     │  │  │  │  ├─ speech.d.ts
│  │     │  │  │  │  ├─ speech.d.ts.map
│  │     │  │  │  │  ├─ speech.js
│  │     │  │  │  │  ├─ speech.js.map
│  │     │  │  │  │  ├─ speech.mjs
│  │     │  │  │  │  ├─ speech.mjs.map
│  │     │  │  │  │  ├─ transcriptions.d.ts
│  │     │  │  │  │  ├─ transcriptions.d.ts.map
│  │     │  │  │  │  ├─ transcriptions.js
│  │     │  │  │  │  ├─ transcriptions.js.map
│  │     │  │  │  │  ├─ transcriptions.mjs
│  │     │  │  │  │  ├─ transcriptions.mjs.map
│  │     │  │  │  │  ├─ translations.d.ts
│  │     │  │  │  │  ├─ translations.d.ts.map
│  │     │  │  │  │  ├─ translations.js
│  │     │  │  │  │  ├─ translations.js.map
│  │     │  │  │  │  ├─ translations.mjs
│  │     │  │  │  │  └─ translations.mjs.map
│  │     │  │  │  ├─ beta
│  │     │  │  │  │  ├─ assistants
│  │     │  │  │  │  │  ├─ assistants.d.ts
│  │     │  │  │  │  │  ├─ assistants.d.ts.map
│  │     │  │  │  │  │  ├─ assistants.js
│  │     │  │  │  │  │  ├─ assistants.js.map
│  │     │  │  │  │  │  ├─ assistants.mjs
│  │     │  │  │  │  │  ├─ assistants.mjs.map
│  │     │  │  │  │  │  ├─ files.d.ts
│  │     │  │  │  │  │  ├─ files.d.ts.map
│  │     │  │  │  │  │  ├─ files.js
│  │     │  │  │  │  │  ├─ files.js.map
│  │     │  │  │  │  │  ├─ files.mjs
│  │     │  │  │  │  │  ├─ files.mjs.map
│  │     │  │  │  │  │  ├─ index.d.ts
│  │     │  │  │  │  │  ├─ index.d.ts.map
│  │     │  │  │  │  │  ├─ index.js
│  │     │  │  │  │  │  ├─ index.js.map
│  │     │  │  │  │  │  ├─ index.mjs
│  │     │  │  │  │  │  └─ index.mjs.map
│  │     │  │  │  │  ├─ beta.d.ts
│  │     │  │  │  │  ├─ beta.d.ts.map
│  │     │  │  │  │  ├─ beta.js
│  │     │  │  │  │  ├─ beta.js.map
│  │     │  │  │  │  ├─ beta.mjs
│  │     │  │  │  │  ├─ beta.mjs.map
│  │     │  │  │  │  ├─ chat
│  │     │  │  │  │  │  ├─ chat.d.ts
│  │     │  │  │  │  │  ├─ chat.d.ts.map
│  │     │  │  │  │  │  ├─ chat.js
│  │     │  │  │  │  │  ├─ chat.js.map
│  │     │  │  │  │  │  ├─ chat.mjs
│  │     │  │  │  │  │  ├─ chat.mjs.map
│  │     │  │  │  │  │  ├─ completions.d.ts
│  │     │  │  │  │  │  ├─ completions.d.ts.map
│  │     │  │  │  │  │  ├─ completions.js
│  │     │  │  │  │  │  ├─ completions.js.map
│  │     │  │  │  │  │  ├─ completions.mjs
│  │     │  │  │  │  │  ├─ completions.mjs.map
│  │     │  │  │  │  │  ├─ index.d.ts
│  │     │  │  │  │  │  ├─ index.d.ts.map
│  │     │  │  │  │  │  ├─ index.js
│  │     │  │  │  │  │  ├─ index.js.map
│  │     │  │  │  │  │  ├─ index.mjs
│  │     │  │  │  │  │  └─ index.mjs.map
│  │     │  │  │  │  ├─ index.d.ts
│  │     │  │  │  │  ├─ index.d.ts.map
│  │     │  │  │  │  ├─ index.js
│  │     │  │  │  │  ├─ index.js.map
│  │     │  │  │  │  ├─ index.mjs
│  │     │  │  │  │  ├─ index.mjs.map
│  │     │  │  │  │  └─ threads
│  │     │  │  │  │     ├─ index.d.ts
│  │     │  │  │  │     ├─ index.d.ts.map
│  │     │  │  │  │     ├─ index.js
│  │     │  │  │  │     ├─ index.js.map
│  │     │  │  │  │     ├─ index.mjs
│  │     │  │  │  │     ├─ index.mjs.map
│  │     │  │  │  │     ├─ messages
│  │     │  │  │  │     │  ├─ files.d.ts
│  │     │  │  │  │     │  ├─ files.d.ts.map
│  │     │  │  │  │     │  ├─ files.js
│  │     │  │  │  │     │  ├─ files.js.map
│  │     │  │  │  │     │  ├─ files.mjs
│  │     │  │  │  │     │  ├─ files.mjs.map
│  │     │  │  │  │     │  ├─ index.d.ts
│  │     │  │  │  │     │  ├─ index.d.ts.map
│  │     │  │  │  │     │  ├─ index.js
│  │     │  │  │  │     │  ├─ index.js.map
│  │     │  │  │  │     │  ├─ index.mjs
│  │     │  │  │  │     │  ├─ index.mjs.map
│  │     │  │  │  │     │  ├─ messages.d.ts
│  │     │  │  │  │     │  ├─ messages.d.ts.map
│  │     │  │  │  │     │  ├─ messages.js
│  │     │  │  │  │     │  ├─ messages.js.map
│  │     │  │  │  │     │  ├─ messages.mjs
│  │     │  │  │  │     │  └─ messages.mjs.map
│  │     │  │  │  │     ├─ runs
│  │     │  │  │  │     │  ├─ index.d.ts
│  │     │  │  │  │     │  ├─ index.d.ts.map
│  │     │  │  │  │     │  ├─ index.js
│  │     │  │  │  │     │  ├─ index.js.map
│  │     │  │  │  │     │  ├─ index.mjs
│  │     │  │  │  │     │  ├─ index.mjs.map
│  │     │  │  │  │     │  ├─ runs.d.ts
│  │     │  │  │  │     │  ├─ runs.d.ts.map
│  │     │  │  │  │     │  ├─ runs.js
│  │     │  │  │  │     │  ├─ runs.js.map
│  │     │  │  │  │     │  ├─ runs.mjs
│  │     │  │  │  │     │  ├─ runs.mjs.map
│  │     │  │  │  │     │  ├─ steps.d.ts
│  │     │  │  │  │     │  ├─ steps.d.ts.map
│  │     │  │  │  │     │  ├─ steps.js
│  │     │  │  │  │     │  ├─ steps.js.map
│  │     │  │  │  │     │  ├─ steps.mjs
│  │     │  │  │  │     │  └─ steps.mjs.map
│  │     │  │  │  │     ├─ threads.d.ts
│  │     │  │  │  │     ├─ threads.d.ts.map
│  │     │  │  │  │     ├─ threads.js
│  │     │  │  │  │     ├─ threads.js.map
│  │     │  │  │  │     ├─ threads.mjs
│  │     │  │  │  │     └─ threads.mjs.map
│  │     │  │  │  ├─ chat
│  │     │  │  │  │  ├─ chat.d.ts
│  │     │  │  │  │  ├─ chat.d.ts.map
│  │     │  │  │  │  ├─ chat.js
│  │     │  │  │  │  ├─ chat.js.map
│  │     │  │  │  │  ├─ chat.mjs
│  │     │  │  │  │  ├─ chat.mjs.map
│  │     │  │  │  │  ├─ completions.d.ts
│  │     │  │  │  │  ├─ completions.d.ts.map
│  │     │  │  │  │  ├─ completions.js
│  │     │  │  │  │  ├─ completions.js.map
│  │     │  │  │  │  ├─ completions.mjs
│  │     │  │  │  │  ├─ completions.mjs.map
│  │     │  │  │  │  ├─ index.d.ts
│  │     │  │  │  │  ├─ index.d.ts.map
│  │     │  │  │  │  ├─ index.js
│  │     │  │  │  │  ├─ index.js.map
│  │     │  │  │  │  ├─ index.mjs
│  │     │  │  │  │  └─ index.mjs.map
│  │     │  │  │  ├─ completions.d.ts
│  │     │  │  │  ├─ completions.d.ts.map
│  │     │  │  │  ├─ completions.js
│  │     │  │  │  ├─ completions.js.map
│  │     │  │  │  ├─ completions.mjs
│  │     │  │  │  ├─ completions.mjs.map
│  │     │  │  │  ├─ embeddings.d.ts
│  │     │  │  │  ├─ embeddings.d.ts.map
│  │     │  │  │  ├─ embeddings.js
│  │     │  │  │  ├─ embeddings.js.map
│  │     │  │  │  ├─ embeddings.mjs
│  │     │  │  │  ├─ embeddings.mjs.map
│  │     │  │  │  ├─ files.d.ts
│  │     │  │  │  ├─ files.d.ts.map
│  │     │  │  │  ├─ files.js
│  │     │  │  │  ├─ files.js.map
│  │     │  │  │  ├─ files.mjs
│  │     │  │  │  ├─ files.mjs.map
│  │     │  │  │  ├─ fine-tuning
│  │     │  │  │  │  ├─ fine-tuning.d.ts
│  │     │  │  │  │  ├─ fine-tuning.d.ts.map
│  │     │  │  │  │  ├─ fine-tuning.js
│  │     │  │  │  │  ├─ fine-tuning.js.map
│  │     │  │  │  │  ├─ fine-tuning.mjs
│  │     │  │  │  │  ├─ fine-tuning.mjs.map
│  │     │  │  │  │  ├─ index.d.ts
│  │     │  │  │  │  ├─ index.d.ts.map
│  │     │  │  │  │  ├─ index.js
│  │     │  │  │  │  ├─ index.js.map
│  │     │  │  │  │  ├─ index.mjs
│  │     │  │  │  │  ├─ index.mjs.map
│  │     │  │  │  │  ├─ jobs.d.ts
│  │     │  │  │  │  ├─ jobs.d.ts.map
│  │     │  │  │  │  ├─ jobs.js
│  │     │  │  │  │  ├─ jobs.js.map
│  │     │  │  │  │  ├─ jobs.mjs
│  │     │  │  │  │  └─ jobs.mjs.map
│  │     │  │  │  ├─ images.d.ts
│  │     │  │  │  ├─ images.d.ts.map
│  │     │  │  │  ├─ images.js
│  │     │  │  │  ├─ images.js.map
│  │     │  │  │  ├─ images.mjs
│  │     │  │  │  ├─ images.mjs.map
│  │     │  │  │  ├─ index.d.ts
│  │     │  │  │  ├─ index.d.ts.map
│  │     │  │  │  ├─ index.js
│  │     │  │  │  ├─ index.js.map
│  │     │  │  │  ├─ index.mjs
│  │     │  │  │  ├─ index.mjs.map
│  │     │  │  │  ├─ models.d.ts
│  │     │  │  │  ├─ models.d.ts.map
│  │     │  │  │  ├─ models.js
│  │     │  │  │  ├─ models.js.map
│  │     │  │  │  ├─ models.mjs
│  │     │  │  │  ├─ models.mjs.map
│  │     │  │  │  ├─ moderations.d.ts
│  │     │  │  │  ├─ moderations.d.ts.map
│  │     │  │  │  ├─ moderations.js
│  │     │  │  │  ├─ moderations.js.map
│  │     │  │  │  ├─ moderations.mjs
│  │     │  │  │  ├─ moderations.mjs.map
│  │     │  │  │  ├─ shared.d.ts
│  │     │  │  │  ├─ shared.d.ts.map
│  │     │  │  │  ├─ shared.js
│  │     │  │  │  ├─ shared.js.map
│  │     │  │  │  ├─ shared.mjs
│  │     │  │  │  └─ shared.mjs.map
│  │     │  │  ├─ shims
│  │     │  │  │  ├─ node.d.ts
│  │     │  │  │  ├─ node.d.ts.map
│  │     │  │  │  ├─ node.js
│  │     │  │  │  ├─ node.js.map
│  │     │  │  │  ├─ node.mjs
│  │     │  │  │  ├─ node.mjs.map
│  │     │  │  │  ├─ web.d.ts
│  │     │  │  │  ├─ web.d.ts.map
│  │     │  │  │  ├─ web.js
│  │     │  │  │  ├─ web.js.map
│  │     │  │  │  ├─ web.mjs
│  │     │  │  │  └─ web.mjs.map
│  │     │  │  ├─ src
│  │     │  │  │  ├─ core.ts
│  │     │  │  │  ├─ error.ts
│  │     │  │  │  ├─ index.ts
│  │     │  │  │  ├─ pagination.ts
│  │     │  │  │  ├─ resource.ts
│  │     │  │  │  ├─ resources
│  │     │  │  │  │  ├─ audio
│  │     │  │  │  │  │  ├─ audio.ts
│  │     │  │  │  │  │  ├─ index.ts
│  │     │  │  │  │  │  ├─ speech.ts
│  │     │  │  │  │  │  ├─ transcriptions.ts
│  │     │  │  │  │  │  └─ translations.ts
│  │     │  │  │  │  ├─ beta
│  │     │  │  │  │  │  ├─ assistants
│  │     │  │  │  │  │  │  ├─ assistants.ts
│  │     │  │  │  │  │  │  ├─ files.ts
│  │     │  │  │  │  │  │  └─ index.ts
│  │     │  │  │  │  │  ├─ beta.ts
│  │     │  │  │  │  │  ├─ chat
│  │     │  │  │  │  │  │  ├─ chat.ts
│  │     │  │  │  │  │  │  ├─ completions.ts
│  │     │  │  │  │  │  │  └─ index.ts
│  │     │  │  │  │  │  ├─ index.ts
│  │     │  │  │  │  │  └─ threads
│  │     │  │  │  │  │     ├─ index.ts
│  │     │  │  │  │  │     ├─ messages
│  │     │  │  │  │  │     │  ├─ files.ts
│  │     │  │  │  │  │     │  ├─ index.ts
│  │     │  │  │  │  │     │  └─ messages.ts
│  │     │  │  │  │  │     ├─ runs
│  │     │  │  │  │  │     │  ├─ index.ts
│  │     │  │  │  │  │     │  ├─ runs.ts
│  │     │  │  │  │  │     │  └─ steps.ts
│  │     │  │  │  │  │     └─ threads.ts
│  │     │  │  │  │  ├─ chat
│  │     │  │  │  │  │  ├─ chat.ts
│  │     │  │  │  │  │  ├─ completions.ts
│  │     │  │  │  │  │  └─ index.ts
│  │     │  │  │  │  ├─ completions.ts
│  │     │  │  │  │  ├─ embeddings.ts
│  │     │  │  │  │  ├─ files.ts
│  │     │  │  │  │  ├─ fine-tuning
│  │     │  │  │  │  │  ├─ fine-tuning.ts
│  │     │  │  │  │  │  ├─ index.ts
│  │     │  │  │  │  │  └─ jobs.ts
│  │     │  │  │  │  ├─ images.ts
│  │     │  │  │  │  ├─ index.ts
│  │     │  │  │  │  ├─ models.ts
│  │     │  │  │  │  ├─ moderations.ts
│  │     │  │  │  │  └─ shared.ts
│  │     │  │  │  ├─ shims
│  │     │  │  │  │  ├─ node.ts
│  │     │  │  │  │  └─ web.ts
│  │     │  │  │  ├─ streaming.ts
│  │     │  │  │  ├─ tsconfig.json
│  │     │  │  │  ├─ uploads.ts
│  │     │  │  │  ├─ version.ts
│  │     │  │  │  └─ _shims
│  │     │  │  │     ├─ auto
│  │     │  │  │     │  ├─ runtime-bun.ts
│  │     │  │  │     │  ├─ runtime-node.ts
│  │     │  │  │     │  ├─ runtime.ts
│  │     │  │  │     │  ├─ types-node.ts
│  │     │  │  │     │  ├─ types.d.ts
│  │     │  │  │     │  ├─ types.js
│  │     │  │  │     │  └─ types.mjs
│  │     │  │  │     ├─ bun-runtime.ts
│  │     │  │  │     ├─ index.d.ts
│  │     │  │  │     ├─ index.js
│  │     │  │  │     ├─ index.mjs
│  │     │  │  │     ├─ manual-types.d.ts
│  │     │  │  │     ├─ manual-types.js
│  │     │  │  │     ├─ manual-types.mjs
│  │     │  │  │     ├─ MultipartBody.ts
│  │     │  │  │     ├─ node-runtime.ts
│  │     │  │  │     ├─ node-types.d.ts
│  │     │  │  │     ├─ node-types.js
│  │     │  │  │     ├─ node-types.mjs
│  │     │  │  │     ├─ README.md
│  │     │  │  │     ├─ registry.ts
│  │     │  │  │     ├─ web-runtime.ts
│  │     │  │  │     ├─ web-types.d.ts
│  │     │  │  │     ├─ web-types.js
│  │     │  │  │     └─ web-types.mjs
│  │     │  │  ├─ streaming.d.ts
│  │     │  │  ├─ streaming.d.ts.map
│  │     │  │  ├─ streaming.js
│  │     │  │  ├─ streaming.js.map
│  │     │  │  ├─ streaming.mjs
│  │     │  │  ├─ streaming.mjs.map
│  │     │  │  ├─ uploads.d.ts
│  │     │  │  ├─ uploads.d.ts.map
│  │     │  │  ├─ uploads.js
│  │     │  │  ├─ uploads.js.map
│  │     │  │  ├─ uploads.mjs
│  │     │  │  ├─ uploads.mjs.map
│  │     │  │  ├─ version.d.ts
│  │     │  │  ├─ version.d.ts.map
│  │     │  │  ├─ version.js
│  │     │  │  ├─ version.js.map
│  │     │  │  ├─ version.mjs
│  │     │  │  ├─ version.mjs.map
│  │     │  │  └─ _shims
│  │     │  │     ├─ auto
│  │     │  │     │  ├─ runtime-bun.d.ts
│  │     │  │     │  ├─ runtime-bun.d.ts.map
│  │     │  │     │  ├─ runtime-bun.js
│  │     │  │     │  ├─ runtime-bun.js.map
│  │     │  │     │  ├─ runtime-bun.mjs
│  │     │  │     │  ├─ runtime-bun.mjs.map
│  │     │  │     │  ├─ runtime-node.d.ts
│  │     │  │     │  ├─ runtime-node.d.ts.map
│  │     │  │     │  ├─ runtime-node.js
│  │     │  │     │  ├─ runtime-node.js.map
│  │     │  │     │  ├─ runtime-node.mjs
│  │     │  │     │  ├─ runtime-node.mjs.map
│  │     │  │     │  ├─ runtime.d.ts
│  │     │  │     │  ├─ runtime.d.ts.map
│  │     │  │     │  ├─ runtime.js
│  │     │  │     │  ├─ runtime.js.map
│  │     │  │     │  ├─ runtime.mjs
│  │     │  │     │  ├─ runtime.mjs.map
│  │     │  │     │  ├─ types-node.d.ts
│  │     │  │     │  ├─ types-node.d.ts.map
│  │     │  │     │  ├─ types-node.js
│  │     │  │     │  ├─ types-node.js.map
│  │     │  │     │  ├─ types-node.mjs
│  │     │  │     │  ├─ types-node.mjs.map
│  │     │  │     │  ├─ types.d.ts
│  │     │  │     │  ├─ types.js
│  │     │  │     │  └─ types.mjs
│  │     │  │     ├─ bun-runtime.d.ts
│  │     │  │     ├─ bun-runtime.d.ts.map
│  │     │  │     ├─ bun-runtime.js
│  │     │  │     ├─ bun-runtime.js.map
│  │     │  │     ├─ bun-runtime.mjs
│  │     │  │     ├─ bun-runtime.mjs.map
│  │     │  │     ├─ index.d.ts
│  │     │  │     ├─ index.js
│  │     │  │     ├─ index.mjs
│  │     │  │     ├─ manual-types.d.ts
│  │     │  │     ├─ manual-types.js
│  │     │  │     ├─ manual-types.mjs
│  │     │  │     ├─ MultipartBody.d.ts
│  │     │  │     ├─ MultipartBody.d.ts.map
│  │     │  │     ├─ MultipartBody.js
│  │     │  │     ├─ MultipartBody.js.map
│  │     │  │     ├─ MultipartBody.mjs
│  │     │  │     ├─ MultipartBody.mjs.map
│  │     │  │     ├─ node-runtime.d.ts
│  │     │  │     ├─ node-runtime.d.ts.map
│  │     │  │     ├─ node-runtime.js
│  │     │  │     ├─ node-runtime.js.map
│  │     │  │     ├─ node-runtime.mjs
│  │     │  │     ├─ node-runtime.mjs.map
│  │     │  │     ├─ node-types.d.ts
│  │     │  │     ├─ node-types.js
│  │     │  │     ├─ node-types.mjs
│  │     │  │     ├─ README.md
│  │     │  │     ├─ registry.d.ts
│  │     │  │     ├─ registry.d.ts.map
│  │     │  │     ├─ registry.js
│  │     │  │     ├─ registry.js.map
│  │     │  │     ├─ registry.mjs
│  │     │  │     ├─ registry.mjs.map
│  │     │  │     ├─ web-runtime.d.ts
│  │     │  │     ├─ web-runtime.d.ts.map
│  │     │  │     ├─ web-runtime.js
│  │     │  │     ├─ web-runtime.js.map
│  │     │  │     ├─ web-runtime.mjs
│  │     │  │     ├─ web-runtime.mjs.map
│  │     │  │     ├─ web-types.d.ts
│  │     │  │     ├─ web-types.js
│  │     │  │     └─ web-types.mjs
│  │     │  ├─ option
│  │     │  │  ├─ .npmignore
│  │     │  │  ├─ index.js
│  │     │  │  ├─ LICENSE
│  │     │  │  ├─ package.json
│  │     │  │  ├─ README.md
│  │     │  │  └─ test
│  │     │  │     └─ options.test.js
│  │     │  ├─ p-cancelable
│  │     │  │  ├─ index.d.ts
│  │     │  │  ├─ index.js
│  │     │  │  ├─ license
│  │     │  │  ├─ package.json
│  │     │  │  └─ readme.md
│  │     │  ├─ pako
│  │     │  │  ├─ CHANGELOG.md
│  │     │  │  ├─ index.js
│  │     │  │  ├─ LICENSE
│  │     │  │  ├─ package.json
│  │     │  │  └─ README.md
│  │     │  ├─ path-is-absolute
│  │     │  │  ├─ index.js
│  │     │  │  ├─ license
│  │     │  │  ├─ package.json
│  │     │  │  └─ readme.md
│  │     │  ├─ pdf-parse
│  │     │  │  ├─ .editorconfig
│  │     │  │  ├─ .gitlab-ci.yml
│  │     │  │  ├─ .jsbeautifyrc
│  │     │  │  ├─ .vscode
│  │     │  │  │  ├─ launch.json
│  │     │  │  │  └─ settings.json
│  │     │  │  ├─ CHANGELOG
│  │     │  │  ├─ CONTRIBUTING.md
│  │     │  │  ├─ index.js
│  │     │  │  ├─ LICENSE
│  │     │  │  ├─ node_modules
│  │     │  │  │  └─ debug
│  │     │  │  │     ├─ CHANGELOG.md
│  │     │  │  │     ├─ LICENSE
│  │     │  │  │     ├─ node.js
│  │     │  │  │     ├─ package.json
│  │     │  │  │     ├─ README.md
│  │     │  │  │     └─ src
│  │     │  │  │        ├─ browser.js
│  │     │  │  │        ├─ common.js
│  │     │  │  │        ├─ index.js
│  │     │  │  │        └─ node.js
│  │     │  │  ├─ NOTES.md
│  │     │  │  ├─ package.json
│  │     │  │  ├─ QUICKSTART.js
│  │     │  │  ├─ README.md
│  │     │  │  └─ test
│  │     │  │     ├─ 01-valid-default.js
│  │     │  │     ├─ 01-valid-v1.10.88.js
│  │     │  │     ├─ 01-valid-v1.9.426.js
│  │     │  │     ├─ 01-valid-v2.0.550.js
│  │     │  │     ├─ 02-valid-default.js
│  │     │  │     ├─ 02-valid-v1.10.88.js
│  │     │  │     ├─ 02-valid-v1.9.426.js
│  │     │  │     ├─ 02-valid-v2.0.550.js
│  │     │  │     ├─ 03-invalid-default.js
│  │     │  │     ├─ 03-invalid-v1.10.88.js
│  │     │  │     ├─ 03-invalid-v1.9.426.js
│  │     │  │     ├─ 03-invalid-v2.0.550.js
│  │     │  │     ├─ 04-valid-default.js
│  │     │  │     ├─ 05-versions-space-default.js
│  │     │  │     └─ data
│  │     │  │        ├─ 01-valid.pdf
│  │     │  │        ├─ 02-valid.pdf
│  │     │  │        ├─ 03-invalid.pdf
│  │     │  │        ├─ 04-valid.pdf
│  │     │  │        └─ 05-versions-space.pdf
│  │     │  ├─ pend
│  │     │  │  ├─ index.js
│  │     │  │  ├─ LICENSE
│  │     │  │  ├─ package.json
│  │     │  │  ├─ README.md
│  │     │  │  └─ test.js
│  │     │  ├─ process-nextick-args
│  │     │  │  ├─ index.js
│  │     │  │  ├─ license.md
│  │     │  │  ├─ package.json
│  │     │  │  └─ readme.md
│  │     │  ├─ progress
│  │     │  │  ├─ CHANGELOG.md
│  │     │  │  ├─ index.js
│  │     │  │  ├─ LICENSE
│  │     │  │  ├─ Makefile
│  │     │  │  ├─ package.json
│  │     │  │  └─ Readme.md
│  │     │  ├─ pump
│  │     │  │  ├─ .travis.yml
│  │     │  │  ├─ index.js
│  │     │  │  ├─ LICENSE
│  │     │  │  ├─ package.json
│  │     │  │  ├─ README.md
│  │     │  │  ├─ test-browser.js
│  │     │  │  └─ test-node.js
│  │     │  ├─ quick-lru
│  │     │  │  ├─ index.d.ts
│  │     │  │  ├─ index.js
│  │     │  │  ├─ license
│  │     │  │  ├─ package.json
│  │     │  │  └─ readme.md
│  │     │  ├─ readable-stream
│  │     │  │  ├─ .travis.yml
│  │     │  │  ├─ CONTRIBUTING.md
│  │     │  │  ├─ doc
│  │     │  │  │  └─ wg-meetings
│  │     │  │  │     └─ 2015-01-30.md
│  │     │  │  ├─ duplex-browser.js
│  │     │  │  ├─ duplex.js
│  │     │  │  ├─ GOVERNANCE.md
│  │     │  │  ├─ LICENSE
│  │     │  │  ├─ package.json
│  │     │  │  ├─ passthrough.js
│  │     │  │  ├─ readable-browser.js
│  │     │  │  ├─ readable.js
│  │     │  │  ├─ README.md
│  │     │  │  ├─ transform.js
│  │     │  │  ├─ writable-browser.js
│  │     │  │  └─ writable.js
│  │     │  ├─ resolve-alpn
│  │     │  │  ├─ index.js
│  │     │  │  ├─ LICENSE
│  │     │  │  ├─ package.json
│  │     │  │  └─ README.md
│  │     │  ├─ responselike
│  │     │  │  ├─ LICENSE
│  │     │  │  ├─ package.json
│  │     │  │  ├─ README.md
│  │     │  │  └─ src
│  │     │  │     └─ index.js
│  │     │  ├─ rimraf
│  │     │  │  ├─ bin.js
│  │     │  │  ├─ LICENSE
│  │     │  │  ├─ package.json
│  │     │  │  ├─ README.md
│  │     │  │  └─ rimraf.js
│  │     │  ├─ roarr
│  │     │  │  ├─ LICENSE
│  │     │  │  ├─ package.json
│  │     │  │  └─ README.md
│  │     │  ├─ safe-buffer
│  │     │  │  ├─ index.d.ts
│  │     │  │  ├─ index.js
│  │     │  │  ├─ LICENSE
│  │     │  │  ├─ package.json
│  │     │  │  └─ README.md
│  │     │  ├─ semver
│  │     │  │  ├─ bin
│  │     │  │  │  └─ semver.js
│  │     │  │  ├─ LICENSE
│  │     │  │  ├─ package.json
│  │     │  │  ├─ range.bnf
│  │     │  │  ├─ README.md
│  │     │  │  └─ semver.js
│  │     │  ├─ semver-compare
│  │     │  │  ├─ .travis.yml
│  │     │  │  ├─ example
│  │     │  │  │  ├─ cmp.js
│  │     │  │  │  └─ lex.js
│  │     │  │  ├─ index.js
│  │     │  │  ├─ LICENSE
│  │     │  │  ├─ package.json
│  │     │  │  ├─ readme.markdown
│  │     │  │  └─ test
│  │     │  │     └─ cmp.js
│  │     │  ├─ serialize-error
│  │     │  │  ├─ index.d.ts
│  │     │  │  ├─ index.js
│  │     │  │  ├─ license
│  │     │  │  ├─ package.json
│  │     │  │  └─ readme.md
│  │     │  ├─ setimmediate
│  │     │  │  ├─ LICENSE.txt
│  │     │  │  ├─ package.json
│  │     │  │  └─ setImmediate.js
│  │     │  ├─ sprintf-js
│  │     │  │  ├─ CONTRIBUTORS.md
│  │     │  │  ├─ LICENSE
│  │     │  │  ├─ package.json
│  │     │  │  ├─ README.md
│  │     │  │  └─ src
│  │     │  │     ├─ angular-sprintf.js
│  │     │  │     └─ sprintf.js
│  │     │  ├─ string_decoder
│  │     │  │  ├─ .travis.yml
│  │     │  │  ├─ LICENSE
│  │     │  │  ├─ package.json
│  │     │  │  └─ README.md
│  │     │  ├─ sumchecker
│  │     │  │  ├─ .github
│  │     │  │  │  ├─ FUNDING.yml
│  │     │  │  │  └─ workflows
│  │     │  │  │     └─ ci.yml
│  │     │  │  ├─ index.d.ts
│  │     │  │  ├─ index.js
│  │     │  │  ├─ index.test-d.ts
│  │     │  │  ├─ LICENSE
│  │     │  │  ├─ NEWS.md
│  │     │  │  ├─ package.json
│  │     │  │  ├─ README.md
│  │     │  │  └─ yarn.lock
│  │     │  ├─ tr46
│  │     │  │  ├─ .npmignore
│  │     │  │  ├─ index.js
│  │     │  │  └─ package.json
│  │     │  ├─ traverse
│  │     │  │  ├─ .npmignore
│  │     │  │  ├─ examples
│  │     │  │  │  ├─ json.js
│  │     │  │  │  ├─ leaves.js
│  │     │  │  │  ├─ negative.js
│  │     │  │  │  └─ stringify.js
│  │     │  │  ├─ index.js
│  │     │  │  ├─ LICENSE
│  │     │  │  ├─ package.json
│  │     │  │  ├─ README.markdown
│  │     │  │  └─ test
│  │     │  │     ├─ circular.js
│  │     │  │     ├─ date.js
│  │     │  │     ├─ equal.js
│  │     │  │     ├─ instance.js
│  │     │  │     ├─ interface.js
│  │     │  │     ├─ json.js
│  │     │  │     ├─ leaves.js
│  │     │  │     ├─ mutability.js
│  │     │  │     ├─ negative.js
│  │     │  │     ├─ obj.js
│  │     │  │     ├─ stop.js
│  │     │  │     ├─ stringify.js
│  │     │  │     └─ super_deep.js
│  │     │  ├─ type-fest
│  │     │  │  ├─ index.d.ts
│  │     │  │  ├─ license
│  │     │  │  ├─ package.json
│  │     │  │  ├─ readme.md
│  │     │  │  └─ source
│  │     │  │     ├─ async-return-type.d.ts
│  │     │  │     ├─ basic.d.ts
│  │     │  │     ├─ conditional-except.d.ts
│  │     │  │     ├─ conditional-keys.d.ts
│  │     │  │     ├─ conditional-pick.d.ts
│  │     │  │     ├─ except.d.ts
│  │     │  │     ├─ literal-union.d.ts
│  │     │  │     ├─ merge-exclusive.d.ts
│  │     │  │     ├─ merge.d.ts
│  │     │  │     ├─ mutable.d.ts
│  │     │  │     ├─ opaque.d.ts
│  │     │  │     ├─ package-json.d.ts
│  │     │  │     ├─ partial-deep.d.ts
│  │     │  │     ├─ promisable.d.ts
│  │     │  │     ├─ promise-value.d.ts
│  │     │  │     ├─ readonly-deep.d.ts
│  │     │  │     ├─ require-at-least-one.d.ts
│  │     │  │     ├─ require-exactly-one.d.ts
│  │     │  │     ├─ set-optional.d.ts
│  │     │  │     ├─ set-required.d.ts
│  │     │  │     ├─ stringified.d.ts
│  │     │  │     ├─ tsconfig-json.d.ts
│  │     │  │     ├─ union-to-intersection.d.ts
│  │     │  │     └─ value-of.d.ts
│  │     │  ├─ underscore
│  │     │  │  ├─ amd
│  │     │  │  │  ├─ after.js
│  │     │  │  │  ├─ allKeys.js
│  │     │  │  │  ├─ before.js
│  │     │  │  │  ├─ bind.js
│  │     │  │  │  ├─ bindAll.js
│  │     │  │  │  ├─ chain.js
│  │     │  │  │  ├─ chunk.js
│  │     │  │  │  ├─ clone.js
│  │     │  │  │  ├─ compact.js
│  │     │  │  │  ├─ compose.js
│  │     │  │  │  ├─ constant.js
│  │     │  │  │  ├─ contains.js
│  │     │  │  │  ├─ countBy.js
│  │     │  │  │  ├─ create.js
│  │     │  │  │  ├─ debounce.js
│  │     │  │  │  ├─ defaults.js
│  │     │  │  │  ├─ defer.js
│  │     │  │  │  ├─ delay.js
│  │     │  │  │  ├─ difference.js
│  │     │  │  │  ├─ each.js
│  │     │  │  │  ├─ escape.js
│  │     │  │  │  ├─ every.js
│  │     │  │  │  ├─ extend.js
│  │     │  │  │  ├─ extendOwn.js
│  │     │  │  │  ├─ filter.js
│  │     │  │  │  ├─ find.js
│  │     │  │  │  ├─ findIndex.js
│  │     │  │  │  ├─ findKey.js
│  │     │  │  │  ├─ findLastIndex.js
│  │     │  │  │  ├─ findWhere.js
│  │     │  │  │  ├─ first.js
│  │     │  │  │  ├─ flatten.js
│  │     │  │  │  ├─ functions.js
│  │     │  │  │  ├─ get.js
│  │     │  │  │  ├─ groupBy.js
│  │     │  │  │  ├─ has.js
│  │     │  │  │  ├─ identity.js
│  │     │  │  │  ├─ index-default.js
│  │     │  │  │  ├─ index.js
│  │     │  │  │  ├─ indexBy.js
│  │     │  │  │  ├─ indexOf.js
│  │     │  │  │  ├─ initial.js
│  │     │  │  │  ├─ intersection.js
│  │     │  │  │  ├─ invert.js
│  │     │  │  │  ├─ invoke.js
│  │     │  │  │  ├─ isArguments.js
│  │     │  │  │  ├─ isArray.js
│  │     │  │  │  ├─ isArrayBuffer.js
│  │     │  │  │  ├─ isBoolean.js
│  │     │  │  │  ├─ isDataView.js
│  │     │  │  │  ├─ isDate.js
│  │     │  │  │  ├─ isElement.js
│  │     │  │  │  ├─ isEmpty.js
│  │     │  │  │  ├─ isEqual.js
│  │     │  │  │  ├─ isError.js
│  │     │  │  │  ├─ isFinite.js
│  │     │  │  │  ├─ isFunction.js
│  │     │  │  │  ├─ isMap.js
│  │     │  │  │  ├─ isMatch.js
│  │     │  │  │  ├─ isNaN.js
│  │     │  │  │  ├─ isNull.js
│  │     │  │  │  ├─ isNumber.js
│  │     │  │  │  ├─ isObject.js
│  │     │  │  │  ├─ isRegExp.js
│  │     │  │  │  ├─ isSet.js
│  │     │  │  │  ├─ isString.js
│  │     │  │  │  ├─ isSymbol.js
│  │     │  │  │  ├─ isTypedArray.js
│  │     │  │  │  ├─ isUndefined.js
│  │     │  │  │  ├─ isWeakMap.js
│  │     │  │  │  ├─ isWeakSet.js
│  │     │  │  │  ├─ iteratee.js
│  │     │  │  │  ├─ keys.js
│  │     │  │  │  ├─ last.js
│  │     │  │  │  ├─ lastIndexOf.js
│  │     │  │  │  ├─ map.js
│  │     │  │  │  ├─ mapObject.js
│  │     │  │  │  ├─ matcher.js
│  │     │  │  │  ├─ max.js
│  │     │  │  │  ├─ memoize.js
│  │     │  │  │  ├─ min.js
│  │     │  │  │  ├─ mixin.js
│  │     │  │  │  ├─ negate.js
│  │     │  │  │  ├─ noop.js
│  │     │  │  │  ├─ now.js
│  │     │  │  │  ├─ object.js
│  │     │  │  │  ├─ omit.js
│  │     │  │  │  ├─ once.js
│  │     │  │  │  ├─ pairs.js
│  │     │  │  │  ├─ partial.js
│  │     │  │  │  ├─ partition.js
│  │     │  │  │  ├─ pick.js
│  │     │  │  │  ├─ pluck.js
│  │     │  │  │  ├─ property.js
│  │     │  │  │  ├─ propertyOf.js
│  │     │  │  │  ├─ random.js
│  │     │  │  │  ├─ range.js
│  │     │  │  │  ├─ reduce.js
│  │     │  │  │  ├─ reduceRight.js
│  │     │  │  │  ├─ reject.js
│  │     │  │  │  ├─ rest.js
│  │     │  │  │  ├─ restArguments.js
│  │     │  │  │  ├─ result.js
│  │     │  │  │  ├─ sample.js
│  │     │  │  │  ├─ set.js
│  │     │  │  │  ├─ shuffle.js
│  │     │  │  │  ├─ size.js
│  │     │  │  │  ├─ some.js
│  │     │  │  │  ├─ sortBy.js
│  │     │  │  │  ├─ sortedIndex.js
│  │     │  │  │  ├─ tap.js
│  │     │  │  │  ├─ template.js
│  │     │  │  │  ├─ templateSettings.js
│  │     │  │  │  ├─ throttle.js
│  │     │  │  │  ├─ times.js
│  │     │  │  │  ├─ toArray.js
│  │     │  │  │  ├─ toPath.js
│  │     │  │  │  ├─ underscore-array-methods.js
│  │     │  │  │  ├─ underscore.js
│  │     │  │  │  ├─ unescape.js
│  │     │  │  │  ├─ union.js
│  │     │  │  │  ├─ uniq.js
│  │     │  │  │  ├─ uniqueId.js
│  │     │  │  │  ├─ unzip.js
│  │     │  │  │  ├─ values.js
│  │     │  │  │  ├─ where.js
│  │     │  │  │  ├─ without.js
│  │     │  │  │  ├─ wrap.js
│  │     │  │  │  ├─ zip.js
│  │     │  │  │  ├─ _baseCreate.js
│  │     │  │  │  ├─ _baseIteratee.js
│  │     │  │  │  ├─ _cb.js
│  │     │  │  │  ├─ _chainResult.js
│  │     │  │  │  ├─ _collectNonEnumProps.js
│  │     │  │  │  ├─ _createAssigner.js
│  │     │  │  │  ├─ _createEscaper.js
│  │     │  │  │  ├─ _createIndexFinder.js
│  │     │  │  │  ├─ _createPredicateIndexFinder.js
│  │     │  │  │  ├─ _createReduce.js
│  │     │  │  │  ├─ _createSizePropertyCheck.js
│  │     │  │  │  ├─ _deepGet.js
│  │     │  │  │  ├─ _escapeMap.js
│  │     │  │  │  ├─ _executeBound.js
│  │     │  │  │  ├─ _flatten.js
│  │     │  │  │  ├─ _getByteLength.js
│  │     │  │  │  ├─ _getLength.js
│  │     │  │  │  ├─ _group.js
│  │     │  │  │  ├─ _has.js
│  │     │  │  │  ├─ _hasObjectTag.js
│  │     │  │  │  ├─ _isArrayLike.js
│  │     │  │  │  ├─ _isBufferLike.js
│  │     │  │  │  ├─ _keyInObj.js
│  │     │  │  │  ├─ _methodFingerprint.js
│  │     │  │  │  ├─ _optimizeCb.js
│  │     │  │  │  ├─ _set.js
│  │     │  │  │  ├─ _setup.js
│  │     │  │  │  ├─ _shallowProperty.js
│  │     │  │  │  ├─ _stringTagBug.js
│  │     │  │  │  ├─ _tagTester.js
│  │     │  │  │  ├─ _toBufferView.js
│  │     │  │  │  ├─ _toPath.js
│  │     │  │  │  └─ _unescapeMap.js
│  │     │  │  ├─ cjs
│  │     │  │  │  ├─ after.js
│  │     │  │  │  ├─ allKeys.js
│  │     │  │  │  ├─ before.js
│  │     │  │  │  ├─ bind.js
│  │     │  │  │  ├─ bindAll.js
│  │     │  │  │  ├─ chain.js
│  │     │  │  │  ├─ chunk.js
│  │     │  │  │  ├─ clone.js
│  │     │  │  │  ├─ compact.js
│  │     │  │  │  ├─ compose.js
│  │     │  │  │  ├─ constant.js
│  │     │  │  │  ├─ contains.js
│  │     │  │  │  ├─ countBy.js
│  │     │  │  │  ├─ create.js
│  │     │  │  │  ├─ debounce.js
│  │     │  │  │  ├─ defaults.js
│  │     │  │  │  ├─ defer.js
│  │     │  │  │  ├─ delay.js
│  │     │  │  │  ├─ difference.js
│  │     │  │  │  ├─ each.js
│  │     │  │  │  ├─ escape.js
│  │     │  │  │  ├─ every.js
│  │     │  │  │  ├─ extend.js
│  │     │  │  │  ├─ extendOwn.js
│  │     │  │  │  ├─ filter.js
│  │     │  │  │  ├─ find.js
│  │     │  │  │  ├─ findIndex.js
│  │     │  │  │  ├─ findKey.js
│  │     │  │  │  ├─ findLastIndex.js
│  │     │  │  │  ├─ findWhere.js
│  │     │  │  │  ├─ first.js
│  │     │  │  │  ├─ flatten.js
│  │     │  │  │  ├─ functions.js
│  │     │  │  │  ├─ get.js
│  │     │  │  │  ├─ groupBy.js
│  │     │  │  │  ├─ has.js
│  │     │  │  │  ├─ identity.js
│  │     │  │  │  ├─ index-default.js
│  │     │  │  │  ├─ index.js
│  │     │  │  │  ├─ indexBy.js
│  │     │  │  │  ├─ indexOf.js
│  │     │  │  │  ├─ initial.js
│  │     │  │  │  ├─ intersection.js
│  │     │  │  │  ├─ invert.js
│  │     │  │  │  ├─ invoke.js
│  │     │  │  │  ├─ isArguments.js
│  │     │  │  │  ├─ isArray.js
│  │     │  │  │  ├─ isArrayBuffer.js
│  │     │  │  │  ├─ isBoolean.js
│  │     │  │  │  ├─ isDataView.js
│  │     │  │  │  ├─ isDate.js
│  │     │  │  │  ├─ isElement.js
│  │     │  │  │  ├─ isEmpty.js
│  │     │  │  │  ├─ isEqual.js
│  │     │  │  │  ├─ isError.js
│  │     │  │  │  ├─ isFinite.js
│  │     │  │  │  ├─ isFunction.js
│  │     │  │  │  ├─ isMap.js
│  │     │  │  │  ├─ isMatch.js
│  │     │  │  │  ├─ isNaN.js
│  │     │  │  │  ├─ isNull.js
│  │     │  │  │  ├─ isNumber.js
│  │     │  │  │  ├─ isObject.js
│  │     │  │  │  ├─ isRegExp.js
│  │     │  │  │  ├─ isSet.js
│  │     │  │  │  ├─ isString.js
│  │     │  │  │  ├─ isSymbol.js
│  │     │  │  │  ├─ isTypedArray.js
│  │     │  │  │  ├─ isUndefined.js
│  │     │  │  │  ├─ isWeakMap.js
│  │     │  │  │  ├─ isWeakSet.js
│  │     │  │  │  ├─ iteratee.js
│  │     │  │  │  ├─ keys.js
│  │     │  │  │  ├─ last.js
│  │     │  │  │  ├─ lastIndexOf.js
│  │     │  │  │  ├─ map.js
│  │     │  │  │  ├─ mapObject.js
│  │     │  │  │  ├─ matcher.js
│  │     │  │  │  ├─ max.js
│  │     │  │  │  ├─ memoize.js
│  │     │  │  │  ├─ min.js
│  │     │  │  │  ├─ mixin.js
│  │     │  │  │  ├─ negate.js
│  │     │  │  │  ├─ noop.js
│  │     │  │  │  ├─ now.js
│  │     │  │  │  ├─ object.js
│  │     │  │  │  ├─ omit.js
│  │     │  │  │  ├─ once.js
│  │     │  │  │  ├─ pairs.js
│  │     │  │  │  ├─ partial.js
│  │     │  │  │  ├─ partition.js
│  │     │  │  │  ├─ pick.js
│  │     │  │  │  ├─ pluck.js
│  │     │  │  │  ├─ property.js
│  │     │  │  │  ├─ propertyOf.js
│  │     │  │  │  ├─ random.js
│  │     │  │  │  ├─ range.js
│  │     │  │  │  ├─ reduce.js
│  │     │  │  │  ├─ reduceRight.js
│  │     │  │  │  ├─ reject.js
│  │     │  │  │  ├─ rest.js
│  │     │  │  │  ├─ restArguments.js
│  │     │  │  │  ├─ result.js
│  │     │  │  │  ├─ sample.js
│  │     │  │  │  ├─ set.js
│  │     │  │  │  ├─ shuffle.js
│  │     │  │  │  ├─ size.js
│  │     │  │  │  ├─ some.js
│  │     │  │  │  ├─ sortBy.js
│  │     │  │  │  ├─ sortedIndex.js
│  │     │  │  │  ├─ tap.js
│  │     │  │  │  ├─ template.js
│  │     │  │  │  ├─ templateSettings.js
│  │     │  │  │  ├─ throttle.js
│  │     │  │  │  ├─ times.js
│  │     │  │  │  ├─ toArray.js
│  │     │  │  │  ├─ toPath.js
│  │     │  │  │  ├─ underscore-array-methods.js
│  │     │  │  │  ├─ underscore.js
│  │     │  │  │  ├─ unescape.js
│  │     │  │  │  ├─ union.js
│  │     │  │  │  ├─ uniq.js
│  │     │  │  │  ├─ uniqueId.js
│  │     │  │  │  ├─ unzip.js
│  │     │  │  │  ├─ values.js
│  │     │  │  │  ├─ where.js
│  │     │  │  │  ├─ without.js
│  │     │  │  │  ├─ wrap.js
│  │     │  │  │  ├─ zip.js
│  │     │  │  │  ├─ _baseCreate.js
│  │     │  │  │  ├─ _baseIteratee.js
│  │     │  │  │  ├─ _cb.js
│  │     │  │  │  ├─ _chainResult.js
│  │     │  │  │  ├─ _collectNonEnumProps.js
│  │     │  │  │  ├─ _createAssigner.js
│  │     │  │  │  ├─ _createEscaper.js
│  │     │  │  │  ├─ _createIndexFinder.js
│  │     │  │  │  ├─ _createPredicateIndexFinder.js
│  │     │  │  │  ├─ _createReduce.js
│  │     │  │  │  ├─ _createSizePropertyCheck.js
│  │     │  │  │  ├─ _deepGet.js
│  │     │  │  │  ├─ _escapeMap.js
│  │     │  │  │  ├─ _executeBound.js
│  │     │  │  │  ├─ _flatten.js
│  │     │  │  │  ├─ _getByteLength.js
│  │     │  │  │  ├─ _getLength.js
│  │     │  │  │  ├─ _group.js
│  │     │  │  │  ├─ _has.js
│  │     │  │  │  ├─ _hasObjectTag.js
│  │     │  │  │  ├─ _isArrayLike.js
│  │     │  │  │  ├─ _isBufferLike.js
│  │     │  │  │  ├─ _keyInObj.js
│  │     │  │  │  ├─ _methodFingerprint.js
│  │     │  │  │  ├─ _optimizeCb.js
│  │     │  │  │  ├─ _set.js
│  │     │  │  │  ├─ _setup.js
│  │     │  │  │  ├─ _shallowProperty.js
│  │     │  │  │  ├─ _stringTagBug.js
│  │     │  │  │  ├─ _tagTester.js
│  │     │  │  │  ├─ _toBufferView.js
│  │     │  │  │  ├─ _toPath.js
│  │     │  │  │  └─ _unescapeMap.js
│  │     │  │  ├─ LICENSE
│  │     │  │  ├─ modules
│  │     │  │  │  ├─ .eslintrc
│  │     │  │  │  ├─ after.js
│  │     │  │  │  ├─ allKeys.js
│  │     │  │  │  ├─ before.js
│  │     │  │  │  ├─ bind.js
│  │     │  │  │  ├─ bindAll.js
│  │     │  │  │  ├─ chain.js
│  │     │  │  │  ├─ chunk.js
│  │     │  │  │  ├─ clone.js
│  │     │  │  │  ├─ compact.js
│  │     │  │  │  ├─ compose.js
│  │     │  │  │  ├─ constant.js
│  │     │  │  │  ├─ contains.js
│  │     │  │  │  ├─ countBy.js
│  │     │  │  │  ├─ create.js
│  │     │  │  │  ├─ debounce.js
│  │     │  │  │  ├─ defaults.js
│  │     │  │  │  ├─ defer.js
│  │     │  │  │  ├─ delay.js
│  │     │  │  │  ├─ difference.js
│  │     │  │  │  ├─ each.js
│  │     │  │  │  ├─ escape.js
│  │     │  │  │  ├─ every.js
│  │     │  │  │  ├─ extend.js
│  │     │  │  │  ├─ extendOwn.js
│  │     │  │  │  ├─ filter.js
│  │     │  │  │  ├─ find.js
│  │     │  │  │  ├─ findIndex.js
│  │     │  │  │  ├─ findKey.js
│  │     │  │  │  ├─ findLastIndex.js
│  │     │  │  │  ├─ findWhere.js
│  │     │  │  │  ├─ first.js
│  │     │  │  │  ├─ flatten.js
│  │     │  │  │  ├─ functions.js
│  │     │  │  │  ├─ get.js
│  │     │  │  │  ├─ groupBy.js
│  │     │  │  │  ├─ has.js
│  │     │  │  │  ├─ identity.js
│  │     │  │  │  ├─ index-all.js
│  │     │  │  │  ├─ index-default.js
│  │     │  │  │  ├─ index.js
│  │     │  │  │  ├─ indexBy.js
│  │     │  │  │  ├─ indexOf.js
│  │     │  │  │  ├─ initial.js
│  │     │  │  │  ├─ intersection.js
│  │     │  │  │  ├─ invert.js
│  │     │  │  │  ├─ invoke.js
│  │     │  │  │  ├─ isArguments.js
│  │     │  │  │  ├─ isArray.js
│  │     │  │  │  ├─ isArrayBuffer.js
│  │     │  │  │  ├─ isBoolean.js
│  │     │  │  │  ├─ isDataView.js
│  │     │  │  │  ├─ isDate.js
│  │     │  │  │  ├─ isElement.js
│  │     │  │  │  ├─ isEmpty.js
│  │     │  │  │  ├─ isEqual.js
│  │     │  │  │  ├─ isError.js
│  │     │  │  │  ├─ isFinite.js
│  │     │  │  │  ├─ isFunction.js
│  │     │  │  │  ├─ isMap.js
│  │     │  │  │  ├─ isMatch.js
│  │     │  │  │  ├─ isNaN.js
│  │     │  │  │  ├─ isNull.js
│  │     │  │  │  ├─ isNumber.js
│  │     │  │  │  ├─ isObject.js
│  │     │  │  │  ├─ isRegExp.js
│  │     │  │  │  ├─ isSet.js
│  │     │  │  │  ├─ isString.js
│  │     │  │  │  ├─ isSymbol.js
│  │     │  │  │  ├─ isTypedArray.js
│  │     │  │  │  ├─ isUndefined.js
│  │     │  │  │  ├─ isWeakMap.js
│  │     │  │  │  ├─ isWeakSet.js
│  │     │  │  │  ├─ iteratee.js
│  │     │  │  │  ├─ keys.js
│  │     │  │  │  ├─ last.js
│  │     │  │  │  ├─ lastIndexOf.js
│  │     │  │  │  ├─ map.js
│  │     │  │  │  ├─ mapObject.js
│  │     │  │  │  ├─ matcher.js
│  │     │  │  │  ├─ max.js
│  │     │  │  │  ├─ memoize.js
│  │     │  │  │  ├─ min.js
│  │     │  │  │  ├─ mixin.js
│  │     │  │  │  ├─ negate.js
│  │     │  │  │  ├─ noop.js
│  │     │  │  │  ├─ now.js
│  │     │  │  │  ├─ object.js
│  │     │  │  │  ├─ omit.js
│  │     │  │  │  ├─ once.js
│  │     │  │  │  ├─ package.json
│  │     │  │  │  ├─ pairs.js
│  │     │  │  │  ├─ partial.js
│  │     │  │  │  ├─ partition.js
│  │     │  │  │  ├─ pick.js
│  │     │  │  │  ├─ pluck.js
│  │     │  │  │  ├─ property.js
│  │     │  │  │  ├─ propertyOf.js
│  │     │  │  │  ├─ random.js
│  │     │  │  │  ├─ range.js
│  │     │  │  │  ├─ reduce.js
│  │     │  │  │  ├─ reduceRight.js
│  │     │  │  │  ├─ reject.js
│  │     │  │  │  ├─ rest.js
│  │     │  │  │  ├─ restArguments.js
│  │     │  │  │  ├─ result.js
│  │     │  │  │  ├─ sample.js
│  │     │  │  │  ├─ shuffle.js
│  │     │  │  │  ├─ size.js
│  │     │  │  │  ├─ some.js
│  │     │  │  │  ├─ sortBy.js
│  │     │  │  │  ├─ sortedIndex.js
│  │     │  │  │  ├─ tap.js
│  │     │  │  │  ├─ template.js
│  │     │  │  │  ├─ templateSettings.js
│  │     │  │  │  ├─ throttle.js
│  │     │  │  │  ├─ times.js
│  │     │  │  │  ├─ toArray.js
│  │     │  │  │  ├─ toPath.js
│  │     │  │  │  ├─ underscore-array-methods.js
│  │     │  │  │  ├─ underscore.js
│  │     │  │  │  ├─ unescape.js
│  │     │  │  │  ├─ union.js
│  │     │  │  │  ├─ uniq.js
│  │     │  │  │  ├─ uniqueId.js
│  │     │  │  │  ├─ unzip.js
│  │     │  │  │  ├─ values.js
│  │     │  │  │  ├─ where.js
│  │     │  │  │  ├─ without.js
│  │     │  │  │  ├─ wrap.js
│  │     │  │  │  ├─ zip.js
│  │     │  │  │  ├─ _baseCreate.js
│  │     │  │  │  ├─ _baseIteratee.js
│  │     │  │  │  ├─ _cb.js
│  │     │  │  │  ├─ _chainResult.js
│  │     │  │  │  ├─ _collectNonEnumProps.js
│  │     │  │  │  ├─ _createAssigner.js
│  │     │  │  │  ├─ _createEscaper.js
│  │     │  │  │  ├─ _createIndexFinder.js
│  │     │  │  │  ├─ _createPredicateIndexFinder.js
│  │     │  │  │  ├─ _createReduce.js
│  │     │  │  │  ├─ _createSizePropertyCheck.js
│  │     │  │  │  ├─ _deepGet.js
│  │     │  │  │  ├─ _escapeMap.js
│  │     │  │  │  ├─ _executeBound.js
│  │     │  │  │  ├─ _flatten.js
│  │     │  │  │  ├─ _getByteLength.js
│  │     │  │  │  ├─ _getLength.js
│  │     │  │  │  ├─ _group.js
│  │     │  │  │  ├─ _has.js
│  │     │  │  │  ├─ _hasObjectTag.js
│  │     │  │  │  ├─ _isArrayLike.js
│  │     │  │  │  ├─ _isBufferLike.js
│  │     │  │  │  ├─ _keyInObj.js
│  │     │  │  │  ├─ _methodFingerprint.js
│  │     │  │  │  ├─ _optimizeCb.js
│  │     │  │  │  ├─ _setup.js
│  │     │  │  │  ├─ _shallowProperty.js
│  │     │  │  │  ├─ _stringTagBug.js
│  │     │  │  │  ├─ _tagTester.js
│  │     │  │  │  ├─ _toBufferView.js
│  │     │  │  │  ├─ _toPath.js
│  │     │  │  │  └─ _unescapeMap.js
│  │     │  │  ├─ package.json
│  │     │  │  ├─ README.md
│  │     │  │  ├─ underscore-esm-min.js
│  │     │  │  ├─ underscore-esm-min.js.map
│  │     │  │  ├─ underscore-esm.js
│  │     │  │  ├─ underscore-esm.js.map
│  │     │  │  ├─ underscore-min.js
│  │     │  │  ├─ underscore-min.js.map
│  │     │  │  ├─ underscore-node-f.cjs
│  │     │  │  ├─ underscore-node-f.cjs.map
│  │     │  │  ├─ underscore-node.cjs
│  │     │  │  ├─ underscore-node.cjs.map
│  │     │  │  ├─ underscore-node.mjs
│  │     │  │  ├─ underscore-node.mjs.map
│  │     │  │  ├─ underscore-umd-min.js
│  │     │  │  ├─ underscore-umd-min.js.map
│  │     │  │  ├─ underscore-umd.js
│  │     │  │  ├─ underscore-umd.js.map
│  │     │  │  └─ underscore.js
│  │     │  ├─ undici-types
│  │     │  │  ├─ agent.d.ts
│  │     │  │  ├─ api.d.ts
│  │     │  │  ├─ balanced-pool.d.ts
│  │     │  │  ├─ cache.d.ts
│  │     │  │  ├─ client.d.ts
│  │     │  │  ├─ connector.d.ts
│  │     │  │  ├─ content-type.d.ts
│  │     │  │  ├─ cookies.d.ts
│  │     │  │  ├─ diagnostics-channel.d.ts
│  │     │  │  ├─ dispatcher.d.ts
│  │     │  │  ├─ errors.d.ts
│  │     │  │  ├─ fetch.d.ts
│  │     │  │  ├─ file.d.ts
│  │     │  │  ├─ filereader.d.ts
│  │     │  │  ├─ formdata.d.ts
│  │     │  │  ├─ global-dispatcher.d.ts
│  │     │  │  ├─ global-origin.d.ts
│  │     │  │  ├─ handlers.d.ts
│  │     │  │  ├─ header.d.ts
│  │     │  │  ├─ index.d.ts
│  │     │  │  ├─ interceptors.d.ts
│  │     │  │  ├─ mock-agent.d.ts
│  │     │  │  ├─ mock-client.d.ts
│  │     │  │  ├─ mock-errors.d.ts
│  │     │  │  ├─ mock-interceptor.d.ts
│  │     │  │  ├─ mock-pool.d.ts
│  │     │  │  ├─ package.json
│  │     │  │  ├─ patch.d.ts
│  │     │  │  ├─ pool-stats.d.ts
│  │     │  │  ├─ pool.d.ts
│  │     │  │  ├─ proxy-agent.d.ts
│  │     │  │  ├─ readable.d.ts
│  │     │  │  ├─ README.md
│  │     │  │  ├─ webidl.d.ts
│  │     │  │  └─ websocket.d.ts
│  │     │  ├─ universalify
│  │     │  │  ├─ index.js
│  │     │  │  ├─ LICENSE
│  │     │  │  ├─ package.json
│  │     │  │  └─ README.md
│  │     │  ├─ unzipper
│  │     │  │  ├─ .circleci
│  │     │  │  │  └─ config.yml
│  │     │  │  ├─ .gitattributes
│  │     │  │  ├─ .travis.yml
│  │     │  │  ├─ LICENSE
│  │     │  │  ├─ package.json
│  │     │  │  ├─ README.md
│  │     │  │  └─ unzip.js
│  │     │  ├─ util-deprecate
│  │     │  │  ├─ browser.js
│  │     │  │  ├─ History.md
│  │     │  │  ├─ LICENSE
│  │     │  │  ├─ node.js
│  │     │  │  ├─ package.json
│  │     │  │  └─ README.md
│  │     │  ├─ web-streams-polyfill
│  │     │  │  ├─ es2018
│  │     │  │  │  └─ package.json
│  │     │  │  ├─ es6
│  │     │  │  │  └─ package.json
│  │     │  │  ├─ LICENSE
│  │     │  │  ├─ package.json
│  │     │  │  ├─ ponyfill
│  │     │  │  │  ├─ es2018
│  │     │  │  │  │  └─ package.json
│  │     │  │  │  ├─ es6
│  │     │  │  │  │  └─ package.json
│  │     │  │  │  └─ package.json
│  │     │  │  └─ README.md
│  │     │  ├─ webidl-conversions
│  │     │  │  ├─ LICENSE.md
│  │     │  │  ├─ package.json
│  │     │  │  └─ README.md
│  │     │  ├─ whatwg-url
│  │     │  │  ├─ LICENSE.txt
│  │     │  │  ├─ package.json
│  │     │  │  └─ README.md
│  │     │  ├─ wrappy
│  │     │  │  ├─ LICENSE
│  │     │  │  ├─ package.json
│  │     │  │  ├─ README.md
│  │     │  │  └─ wrappy.js
│  │     │  ├─ xmlbuilder
│  │     │  │  ├─ appveyor.yml
│  │     │  │  ├─ CHANGELOG.md
│  │     │  │  ├─ LICENSE
│  │     │  │  ├─ package.json
│  │     │  │  └─ README.md
│  │     │  ├─ yallist
│  │     │  │  ├─ iterator.js
│  │     │  │  ├─ LICENSE
│  │     │  │  ├─ package.json
│  │     │  │  ├─ README.md
│  │     │  │  └─ yallist.js
│  │     │  └─ yauzl
│  │     │     ├─ index.js
│  │     │     ├─ LICENSE
│  │     │     ├─ package.json
│  │     │     └─ README.md
│  │     ├─ package-lock.json
│  │     ├─ package.json
│  │     ├─ preload.js
│  │     ├─ railway.toml
│  │     ├─ README.md
│  │     └─ static
│  │        ├─ images
│  │        │  └─ fabric-logo-gif.gif
│  │        ├─ js
│  │        │  ├─ bootstrap.min.js
│  │        │  ├─ index.js
│  │        │  └─ jquery-3.0.0.slim.min.js
│  │        └─ stylesheet
│  │           ├─ bootstrap.min.css
│  │           └─ style.css
│  ├─ server
│  │  ├─ api
│  │  │  ├─ fabric_api_keys.json
│  │  │  ├─ fabric_api_server.py
│  │  │  ├─ users.json
│  │  │  └─ __init__.py
│  │  ├─ webui
│  │  │  ├─ fabric-logo-miessler-transparent.png
│  │  │  ├─ fabric_web_interface_keys.json
│  │  │  ├─ fabric_web_server.py
│  │  │  ├─ favicon.ico
│  │  │  ├─ static
│  │  │  │  ├─ fabric-logo-miessler-transparent.png
│  │  │  │  └─ favicon.ico
│  │  │  ├─ templates
│  │  │  │  └─ index.html
│  │  │  └─ __init__.py
│  │  └─ __init__.py
│  └─ __init__.py
├─ LICENSE.txt
├─ patterns
│  ├─ agility_story
│  │  ├─ system.md
│  │  └─ user.md
│  ├─ ai
│  │  ├─ system.md
│  │  └─ user.md
│  ├─ analyze_claims
│  │  ├─ system.md
│  │  └─ user.md
│  ├─ analyze_incident
│  │  ├─ system.md
│  │  └─ user.md
│  ├─ analyze_paper
│  │  ├─ system.md
│  │  └─ user.md
│  ├─ analyze_prose
│  │  ├─ system.md
│  │  └─ user.md
│  ├─ analyze_prose_json
│  │  ├─ system.md
│  │  └─ user.md
│  ├─ analyze_spiritual_text
│  │  ├─ system.md
│  │  └─ user.md
│  ├─ analyze_threat_report
│  │  ├─ system.md
│  │  └─ user.md
│  ├─ analyze_threat_report_trends
│  │  ├─ system.md
│  │  └─ user.md
│  ├─ check_agreement
│  │  ├─ system.md
│  │  └─ user.md
│  ├─ clean_text
│  │  ├─ system.md
│  │  └─ user.md
│  ├─ compare_and_contrast
│  │  ├─ system.md
│  │  └─ user.md
│  ├─ create_aphorisms
│  │  ├─ system.md
│  │  └─ user.md
│  ├─ create_logo
│  │  ├─ system.md
│  │  └─ user.md
│  ├─ create_npc
│  │  ├─ system.md
│  │  └─ user.md
│  ├─ create_video_chapters
│  │  ├─ system.md
│  │  └─ user.md
│  ├─ explain_code
│  │  ├─ system.md
│  │  └─ user.md
│  ├─ explain_docs
│  │  ├─ system.md
│  │  └─ user.md
│  ├─ extract_article_wisdom
│  │  ├─ dmiessler
│  │  │  └─ extract_wisdom-1.0.0
│  │  │     ├─ system.md
│  │  │     └─ user.md
│  │  ├─ README.md
│  │  ├─ system.md
│  │  └─ user.md
│  ├─ extract_poc
│  │  ├─ system.md
│  │  └─ user.md
│  ├─ extract_recommendations
│  │  ├─ system.md
│  │  └─ user.md
│  ├─ extract_references
│  │  ├─ system.md
│  │  └─ user.md
│  ├─ extract_sponsors
│  │  ├─ system.md
│  │  └─ user.md
│  ├─ extract_videoid
│  │  ├─ system.md
│  │  └─ user.md
│  ├─ extract_wisdom
│  │  ├─ dmiessler
│  │  │  └─ extract_wisdom-1.0.0
│  │  │     ├─ system.md
│  │  │     └─ user.md
│  │  ├─ README.md
│  │  ├─ system.md
│  │  └─ user.md
│  ├─ improve_prompt
│  │  ├─ system.md
│  │  └─ user.md
│  ├─ improve_writing
│  │  ├─ system.md
│  │  └─ user.md
│  ├─ label_and_rate
│  │  ├─ system.md
│  │  └─ user.md
│  ├─ philocapsulate
│  │  ├─ system.md
│  │  └─ user.md
│  ├─ rate_content
│  │  ├─ system.md
│  │  └─ user.md
│  ├─ rate_value
│  │  ├─ README.md
│  │  ├─ system.md
│  │  └─ user.md
│  ├─ summarize
│  │  ├─ dmiessler
│  │  │  └─ summarize
│  │  │     ├─ system.md
│  │  │     └─ user.md
│  │  ├─ system.md
│  │  └─ user.md
│  ├─ summarize_micro
│  │  ├─ system.md
│  │  └─ user.md
│  ├─ summarize_newsletter
│  │  ├─ system.md
│  │  └─ user.md
│  ├─ summarize_pull-requests
│  │  ├─ system.md
│  │  └─ user.md
│  ├─ summarize_rpg_session
│  │  ├─ system.md
│  │  └─ user.md
│  ├─ write_essay
│  │  ├─ README.md
│  │  ├─ system.md
│  │  └─ user.md
│  └─ write_semgrep_rule
│     ├─ system.md
│     └─ user.md
├─ poetry.lock
├─ pyproject.toml
├─ railway.toml
├─ README.md
└─ setup.sh

```