# @jimmyyen/opencode-speak-human-tw

[![npm](https://img.shields.io/npm/v/@jimmyyen/opencode-speak-human-tw)](https://www.npmjs.com/package/@jimmyyen/opencode-speak-human-tw)
[![npm downloads](https://img.shields.io/npm/dm/@jimmyyen/opencode-speak-human-tw)](https://www.npmjs.com/package/@jimmyyen/opencode-speak-human-tw)

將 [Raymond Hou (雷蒙三十)](https://github.com/Raymondhou0917) 的 [speak-human-tw](https://github.com/Raymondhou0917/speak-human-tw) 移植成 [OpenCode](https://github.com/opencode-ai/opencode) 的 plugin。

## 安裝

`opencode.json` 的 `plugin` 陣列加一行：

```json
{
  "plugin": ["@jimmyyen/opencode-speak-human-tw"]
}
```

## 用法

- `/speak-human-tw` 直接貼文字
- `/speak-human-tw @filename.md` 用 `@` 傳檔案
- 直接說「這段去 AI 味」「幫我潤稿」，skill 就會自動處理

## 授權

MIT，同原專案。

## 原始專案

[speak-human-tw](https://github.com/Raymondhou0917/speak-human-tw) by [Raymond Hou (雷蒙三十)](https://github.com/Raymondhou0917)。安裝教學、案例示範、38 種 AI 痕跡詳解見[原始 README](https://github.com/Raymondhou0917/speak-human-tw/blob/main/README.md)。
