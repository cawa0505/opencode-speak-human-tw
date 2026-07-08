<div align="center">

# 說人話 speak-human-tw

### *字都對，卻不像人講的話？那就是 AI 味。*

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![Benchmark](https://img.shields.io/badge/benchmark-36_cases-blue.svg)](evals/benchmark.md)
[![zh-TW](https://img.shields.io/badge/zh--TW-Taiwan-e4002b.svg)](references/taiwan-localization.md)

<br>

<table>
<tr><td align="left">

🤖 &nbsp;AI 幫你把稿子寫好了，你自己讀一遍卻覺得哪裡怪，但又說不出來哪裡怪？<br>
📮 &nbsp;電子報資訊全對，讀起來卻像新聞稿，不像你在跟讀者講話？<br>
😮‍💨 &nbsp;每次都要一句一句抓「這句好 AI」再重寫，改到最後比自己從頭寫還累？

</td></tr>
</table>

### ✨ 這些，說人話都能解決。

<br>

一個專門校對繁體中文的 skill：抓出 36 種 AI 寫作痕跡，順手把中國用語和半形標點改成台灣的寫法，改寫成讀起來像人寫的版本，還附一份交稿前能自己打分數的檢核表。

給 Claude Code、Codex、Cursor 和任何能讀 Markdown 的 AI agent 用。

**內容創作 · 行銷文案 · 日常辦公** —— 電子報 · 社群貼文 · 銷售頁 · 客服回信 · 簡報 · 公告 · Email

<br>

**先保住事實 → 再清掉 AI 味 → 最後才加人味**

不是把你的稿子洗成機器人，是把 AI 味洗掉、把你洗回來。

</div>

---

## 改成什麼樣

### 社群貼文：emoji 轟炸＋勸誡收尾

**改寫前**

> 🚀 重磅消息！AI 寫作工作坊正式上線啦！💡 這不僅僅是一堂課，更是一場思維的革命。與其在原地焦慮，不如現在就出發。畢竟，機會永遠留給準備好的人，不是嗎？🔥

**改寫後**

> AI 寫作工作坊開放報名了。三個小時，教你三件事：怎麼讓 AI 抓到你的語氣、怎麼建自己的改稿流程、怎麼把重複的產文工作自動化。上一梯 40 個名額，三天就額滿，這梯加開到 60 個，別錯過了。

### 電子報：拔高詞＋解說導引句

**改寫前**

> 值得注意的是，這個結果深刻地印證了內容產業瞬息萬變的本質。把這些數字擺在一起，你會讀到一件很重要的事：讀者的習慣比我們想像的更頑固。

**改寫後**

> 開信率從 31% 掉到 24%。讀者的習慣比我想像的頑固：你們就是習慣週五早上配咖啡看信是吧。好，那我下一期改回週五發！

### 台灣在地化：中國用語校正改寫

**改寫前**

> 這個視頻的質量真的很高，信息量很大，博主講得特別接地氣。

**改寫後**

> 這支影片品質很高，知識量很大，創作者把抽象概念講得很生活化。

更多場景（銷售頁、客服回信、公告）的完整 before/after 見 [references/examples.md](references/examples.md)。

## 30 秒上手

**Claude Code**：

```bash
git clone https://github.com/Raymondhou0917/speak-human-tw.git ~/.claude/skills/speak-human-tw
```

裝好後在對話裡說「幫這段去 AI 味」「這段好 AI，說人話」就會自動觸發。

**Codex（單次使用）**：

```bash
git clone https://github.com/Raymondhou0917/speak-human-tw.git && cd speak-human-tw
codex exec -C . "讀取 ./SKILL.md，按規則改寫以下文字：（貼上你的文字）"
```

**只想先看問題、不要改稿**：指令加一句「先標問題不要改」，會切到 annotation mode，只列出 1 到 5 個問題點。

各平台完整安裝方式（含 Cursor、symlink 跟隨更新）見下方[安裝](#安裝)。

## 它怎麼改

一句話原則：**先保事實，再去 AI 味，最後才加人味。**

固定六步：

1. **判情境**：社群貼文／電子報／銷售頁／客服回信／辦公文書，五種情境力度不同。社群改輕保留口語感，銷售頁改重但 CTA 力道不能弱
2. **鎖保護清單**：價格、優惠碼、專有名詞、連結、真名與引號原話、退費承諾先圈起來，改寫全程不動
3. **判範圍**：長文（約 1000 字以上）不擅自縮水，整句空話列「建議刪除（待確認）」清單交你拍板
4. **逐類改寫**：36 種痕跡逐類處理，模式優先、詞表兜底；台灣用語檢查同步跑
5. **保真回讀**：保護清單逐項核對，每個資訊點可追溯，不新增原文沒有的事實
6. **交稿前自評**：長文用 5 維 50 分制打分，低於 35 分不交稿

### 檢測的 36 種 AI 痕跡

| 分類 | 數量 | 例子 |
| :-- | :-- | :-- |
| 內容類 | 8 | 誇大意義（標誌著、奠定基礎）、模糊歸屬（業界專家認為）、幻覺引用、公式化前景段 |
| 語言句式類 | 11 | 「不是 A 而是 B」堆疊、排比三段式、解說導引句、勸誡反問收尾、說教深度腔（說到底、本質上）、金句公式（X 是 Y 的 Z）、假坦白鉤子（說真的、老實說）、戲劇性短句轟炸 |
| 風格版面類 | 8 | 破折號過密、粗體轟炸、emoji 堆疊、編號切碎段落、表格誤用 |
| 溝通殘留類 | 7 | 「希望這對你有幫助」、諂媚開場、知識截止免責、模板佔位文字、預告式導言（廢話不多說、讓我們來看看） |
| 工具痕跡類 | 2 | `utm_source=chatgpt.com`、`turn0search` 佔位碼、Markdown 標記錯置 |

完整清單與範例句見 [references/patterns.md](references/patterns.md)。台灣在地化層（60+ 組中國用語對照、全形標點、引號規則）見 [references/taiwan-localization.md](references/taiwan-localization.md)。

## 為什麼不是又一個「去 AI 味」工具

中文圈已經有做得很好的方案，我們補的是不同的一塊：

- **知識源**：主要整理自[中文維基百科「AI生成文的特徵」](https://zh.wikipedia.org/zh-tw/Wikipedia:AI生成文的特徵)（WikiProject AI Cleanup 社群為了清理 AI 條目持續更新的第一手觀察）與朱宥勳的「AI腔」句型分析
- **場景**：不是工程師的 README 和 release note，而是電子報、社群貼文、銷售頁、客服回信、辦公文書。保護的不是版本號和命令，而是價格、優惠碼、見證人真名、退費承諾
- **語言**：從頭以繁體中文與台灣用語校準，內建中國用語檢查。不是單純簡轉繁
- **實戰驗證**：核心規則來自一年多的真實改稿紀錄：哪些 AI 習慣被人類編輯反覆抓出來（破折號密度、「不是 A 而是 B」上限、粗體上限），全部進了規則和評測集

## 評測

[evals/benchmark.md](evals/benchmark.md) 目前 36 條用例：24 條 SF（該改必中）＋ 12 條 SNF（不可誤殺）。SNF 專門保護容易被誤殺的情況：有事實撐著的排比、有來源的數據、金流制式條款、長文節奏句、被討論的 AI 味詞。

判分含「不換湯」規則：刪掉「標誌著」卻補上「象徵著」，記失敗。跑法見 [evals/run-eval.md](evals/run-eval.md)。

## 安裝

| 平台 | 文件 |
| :-- | :-- |
| Claude Code | [install/claude-code.md](install/claude-code.md) |
| Codex | [install/codex.md](install/codex.md) |
| Cursor | [install/cursor.md](install/cursor.md) |

核心只需要 `SKILL.md` 一個檔案（lite）；要完整的 36 種痕跡、台灣用語表和誤殺防護，帶上 `references/` 完整包（full）。

## 常見問題

### 這是拿來騙 AI 偵測器的嗎？

不是。目標是讓文字真正讀起來更好：更具體、更誠實、更像一個具體的人在說話。最好的「去 AI 味」是文字裡有真實的思考。

### 改完會變成某個人的風格嗎？

不會。這個 skill 把稿子洗乾淨，不會替你注入人設。「去 AI 味」和「有個人風格」是兩件事：前者是及格線，後者要你自己（或你專屬的風格 skill）來加。

### 簡體中文能用嗎？

規則大多通用，但台灣在地化層（用語對照、全形標點慣例）是為繁體中文台灣讀者設計的。簡中場景建議用 [MrGeDiao/shuorenhua](https://github.com/MrGeDiao/shuorenhua)。

### 會不會把我的銷售頁改到沒有轉換力？

不會。銷售頁情境明文規定：CTA 力道與急迫感是功能不是 AI 味，價格、優惠碼、期限、退費條款在保護清單裡一字不動。評測集有專門的誤殺防護用例（SNF-01 到 03）盯著這件事。

### 為什麼改完有時還是有點 AI 味？

「清掉明顯套路」不等於「擁有你的個人聲音」。遇到改完仍不自然的案例，用 [bad case 模板](.github/ISSUE_TEMPLATE/bad-case.md)回報，這比 star 更有用。

## 貢獻

歡迎提 Issue 和 PR：新的 AI 味模式、更貼切的範例句、中國用語對照的補充、評測用例。提交前請先讀 [CONTRIBUTING.md](CONTRIBUTING.md)，核心判斷只有一個：

> 這是一個「新模式」，還是「現有模式的變體」？

## 參考資源

- [中文維基百科：AI生成文的特徵](https://zh.wikipedia.org/zh-tw/Wikipedia:AI生成文的特徵)：主要知識來源，收錄真實的繁中案例
- [朱宥勳「AI腔」分析](https://www.youtube.com/@chuckchu)：否定平行結構一節的靈感來源
- [Wikipedia: Signs of AI writing](https://en.wikipedia.org/wiki/Wikipedia:Signs_of_AI_writing)：英文版原始指南
- [MrGeDiao/shuorenhua](https://github.com/MrGeDiao/shuorenhua)：簡體中文去 AI 味的先行者，鎖定工程師與技術文件場景。保護片段、情境分級、SF/SNF 評測的方法論給了很好的參考，本專案把這套方法論帶到繁體中文與內容行銷場景重新設計
- [blader/humanizer](https://github.com/blader/humanizer)、[hardikpandya/stop-slop](https://github.com/hardikpandya/stop-slop)：英文先行專案

所有範例句、詞表、保護清單、情境策略皆針對繁體中文場景原創撰寫，不翻譯、不移植上述任何專案的內容。

## 授權

[MIT License](LICENSE)。歡迎 fork、修改、提 PR。
