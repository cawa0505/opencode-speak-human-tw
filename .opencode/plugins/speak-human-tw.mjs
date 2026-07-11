// speak-human-tw — OpenCode plugin.
//
// Registers the 說人話 (de-AI rewriting) skill for Traditional Chinese
// plus /speak-human-tw and /說人話 slash commands visible in the UI.
// Install: { "plugin": ["opencode-speak-human-tw"] }

import path from 'path';
import { fileURLToPath } from 'url';

const __dirname = path.dirname(fileURLToPath(import.meta.url));
const skillsDir = path.resolve(__dirname, '../../skills');

export default async () => ({
  config: async (config) => {
    config.skills = config.skills || {};
    config.skills.paths = config.skills.paths || [];
    if (!config.skills.paths.includes(skillsDir)) {
      config.skills.paths.push(skillsDir);
    }

    config.command = config.command || {};
    config.command['speak-human-tw'] = {
      template: '',
      description: '說人話：繁體中文去 AI 味改寫',
    };
    config.command['說人話'] = {
      template: '',
      description: '說人話啟動 — 去 AI 味改寫',
    };
  },
});
