// speak-human-tw — OpenCode plugin.
//
// Registers the 說人話 (de-AI rewriting) skill for Traditional Chinese.
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

  },
});
