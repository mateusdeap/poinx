# Poinx

A clone of [points](https://github.com/fastruby/points), but in Elixir and Phoenix.

## Contributing

Since this is for our study group, and we might have to stop a session in the middle of some work, after each session, we can just add here
What was done, where we stopped and why and where we need to pick up from in the next session.

### Session 1 - June 20th, 2022
- **Participants**: Mateus, Cleiviane and Kuda.
- **What got done**: Added the `Project` resource
- **Where we stopped**: We were unable to figure out how to properly add a nested live view resource. Specifically, when trying to add the `Add Story` button to the project's live view show page, it would always try to render the modal present in the `index.html.heex` in the `story_live` folder. In order to move on, we just need to figure out how to make it render that modal in our current context.

### Session 2 - July 4th, 2022
- **Participants**: Mateus and Henrique.
- **What got done**: Finished correctly adding `Story` resource and modified boilerplate code in order to have story creation in the context of showing a project. Also got Henrique up to speed on what we're doing and our current status
- **Where we stopped**: The natural next step is to implement the other CRUD actions related to stories and maybe even change the UX/UI related to adding and editing them in order to highlight what LiveView can do.
