# Changelog

本檔案記錄每個版本的變更。格式參考 [Keep a Changelog](https://keepachangelog.com/zh-TW/)，每版固定四段：Added（新增）、Changed（變更）、Tested（驗證）、Notes（邊界與未做的事）。

## [Unreleased]

（下一版的變更累積在這裡）

## [1.1.0] - 2026-07-08 — 補齊痕跡與範例

### Added

- `references/patterns.md`：AI 痕跡從 31 種擴充到 36 種，新增 5 種（比對 blader/humanizer 與英文維基「Signs of AI writing」後補上的中文文案常見缺口）：
  - 說教式深度腔（說到底、本質上、真正的問題在於、核心在於）
  - 金句／格言公式（X 是 Y 的 Z、不是工具而是一面鏡子、一場關於⋯的革命）
  - 假坦白鉤子開場（說真的、老實說、講白了 當鉤子）
  - 戲劇性短句轟炸（連續極短句堆疊硬造史詩感）
  - 預告式導言（廢話不多說、讓我們一起來看看、接下來帶你了解）
- `references/examples.md`：before/after 從 5 組擴充到 13 組。每個既有場景補第二組範例，並新增三個場景：個人品牌貼文（職場感言）、電商產品文案、自我介紹 / Bio

### Changed

- `references/patterns.md` 分類小計更新為：內容 8、語言句式 11、風格版面 8、溝通殘留 7、工具痕跡 2；快速檢查清單新增「戲劇短句」「假坦白開場」「金句公式」三項自查
- 新增提醒：第 16–19 種（說教深度腔、金句公式、假坦白鉤子、戲劇短句）常是「去 AI 味」時被誤加的假人味，改寫時要避免自己踩進去
- 同步 `README.md` / `SKILL.md` / `CONTRIBUTING.md` / `references/humanize.md` / `install/claude-code.md` 與 banner 內「31 種」計數

### Tested

- 人工核對 `patterns.md` 編號連續（1–36）、五類小計加總正確、目錄錨點與內文一致

### Notes

- 未改動 `evals/benchmark.md` 的 SF/SNF 用例邏輯（仍 36 條）；新痕跡的專屬評測用例列為下一版 follow-up
- 「36 種痕跡」與「36 條 benchmark」數字相同純屬巧合，兩者是不同概念

## [1.0.0] - 2026-07-08 — 首次公開發布

### Added

- `SKILL.md`：六步執行流程（判情境 → 鎖保護清單 → 判範圍 → 逐類改寫 → 保真回讀 → 交稿前自評）、單檔兜底規則、annotation mode 輸出合同
- `references/patterns.md`：31 種 AI 寫作痕跡，分五類（內容 8、語言句式 7、風格版面 8、溝通殘留 6、工具痕跡 2），每種附識別信號與原創繁中 ❌/✅ 範例
- `references/taiwan-localization.md`：台灣在地化層，60+ 組中國用語對照、按語境判斷詞、全形標點與引號規則、台灣語感校準、誤殺防護
- `references/scenes.md`：五大情境細部策略（社群貼文／電子報／銷售頁／客服回信／辦公文書），各附力度、目標與禁改項
- `references/protected-list.md`：五類保護對象（價格數字、專有名詞、連結、真名與原話、承諾條款）、九種容易誤殺的情況對照表、回讀核對程序
- `references/examples.md`：五個情境的完整 before/after 示範，附「改了什麼、為什麼」；annotation mode 輸出示範
- `references/humanize.md`：人味正向目標（反應、節奏、矛盾、第一人稱、不完美）與三個「不要」
- `evals/benchmark.md`：36 條評測用例（24 SF ＋ 12 SNF），含台灣用語、破折號密度、保護清單誤殺陷阱、長文 scope 用例，附覆蓋矩陣
- `evals/run-eval.md`：判分標準（命中／保真／不換湯／長度節奏）、單模型快速自查與雙模型交叉評測流程
- `install/`：Claude Code、Codex、Cursor 三平台安裝指南
- `CONTRIBUTING.md`：協作指南，含「新模式 vs 變體」判斷、bad case 提交、新模型口癖巡檢的維護者流程
- `.github/ISSUE_TEMPLATE/bad-case.md`：「改完還是像 AI」的結構化回報模板

### Changed

- 專案從 `shuorenhua-tw` 更名為「說人話 speak-human-tw」，定位從「內容創作者」放寬為「繁體中文的內容創作、行銷文案、日常辦公」
- 知識源主體改為中文維基百科「AI生成文的特徵」條目＋朱宥勳「AI腔」分析；痕跡從 22 種擴充到 31 種（新增：均值回歸、幻覺引用、公式化前景段、解說導引句、勸誡反問收尾、編號切碎段落、句長過勻、模板佔位文字、AI 工具殘留物、Markdown 標記錯置）
- 台灣在地化從「標點規則」擴充為獨立一層（用語對照＋語感校準）

### Tested

- 發布前以 fresh agent 對 benchmark 全量 36 條做實跑驗證（結果歸檔於 `evals/results-v1.0.0.md`）

### Notes

- 本版不含：ChatGPT Custom GPT 安裝方式、英文版說明、自動化 intake 工具鏈；等有真實社群回饋後評估
- 方法論致謝：保護片段、情境×力度分級、SF/SNF 成對評測的做法參考 [MrGeDiao/shuorenhua](https://github.com/MrGeDiao/shuorenhua)，所有內容（範例句、詞表、規則文字）針對繁中場景原創撰寫
