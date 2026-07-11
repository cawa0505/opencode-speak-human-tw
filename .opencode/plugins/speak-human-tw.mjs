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

    // Register /speak-human-tw slash command
    config.command = config.command || {};
    if (!config.command['speak-human-tw']) {
      config.command['speak-human-tw'] = {
        description: '去 AI 味改寫：分析文字中的 AI 痕跡，列出建議清單，等確認後才動筆。',
        template: '請對以下文字執行 speak-human-tw skill：\n\n$ARGUMENTS',
      };
    }
  },
});
