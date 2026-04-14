/**
 * Chrome 디버깅 모드 실행 시 사용할 명령어를 출력합니다.
 * 실제로 Chrome을 실행하지는 않고, 사용자가 복사해서 쓸 수 있는 명령만 출력합니다.
 */

const path = require('path');
const configPath = path.join(__dirname, '..', 'config.json');
let port = 9222;
try {
  const config = require(configPath);
  port = config.chrome?.debuggingPort ?? 9222;
} catch (e) {}

console.log(`
========================================
Chrome 디버깅 모드 실행 방법 (Windows)
========================================

1) 기존 Chrome을 모두 종료한 뒤, 아래 중 하나로 실행하세요.

   방법 A - 바로가기 수정
   - Chrome 바로가기 우클릭 → 속성
   - "대상" 끝에 다음을 한 칸 띄고 추가:
     --remote-debugging-port=${port}

   방법 B - 명령 프롬프트에서 (Chrome 경로는 PC에 맞게 수정)
   "C:\\Program Files\\Google\\Chrome\\Application\\chrome.exe" --remote-debugging-port=${port}

   방법 C - PowerShell 한 줄
   & "C:\\Program Files\\Google\\Chrome\\Application\\chrome.exe" --remote-debugging-port=${port}

2) 열린 Chrome에서 네이버에 로그인하고, 블로그 관리 권한이 있는지 확인하세요.

3) 이 터미널을 닫지 말고, 새 터미널에서:
   npm run collect
   또는
   node index.js

========================================
`);
