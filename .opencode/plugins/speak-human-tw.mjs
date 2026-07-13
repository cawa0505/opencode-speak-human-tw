// speak-human-tw — OpenCode plugin.
//
// Registers the 說人話 (de-AI rewriting) skill for Traditional Chinese
// plus /speak-human-tw and /說人話 slash commands visible in the UI.
// Install: { "plugin": ["opencode-speak-human-tw"] }

import path from 'path';
import { fileURLToPath } from 'url';
import { startAutoUpdate } from '../../src/auto-update.mjs';

const __dirname = path.dirname(fileURLToPath(import.meta.url));
const skillsDir = path.resolve(__dirname, '../../skills');

const COMMANDS = ['speak-human-tw', '說人話'];

export default async (ctx) => {
  startAutoUpdate(ctx);
  return {
    config: async (config) => {
      config.skills = config.skills || {};
      config.skills.paths = config.skills.paths || [];
      if (!config.skills.paths.includes(skillsDir)) {
        config.skills.paths.push(skillsDir);
      }

      config.command = config.command || {};
      for (const name of COMMANDS) {
        config.command[name] = {
          template: '說人話：請將以下文字去除 AI 味，改寫成自然的中文：\n\n',
          description: '說人話：繁體中文去 AI 味改寫',
        };
      }
    },

    'command.execute.before': async (command) => {
      if (COMMANDS.includes(command.command)) {
        // Don't intercept — let the command pass through to the LLM.
        // The LLM will see the trigger keyword and invoke the skill.
        return;
      }
    },
  };
};
