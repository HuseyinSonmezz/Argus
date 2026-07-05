import sys
import subprocess
import os
from datetime import datetime

GREEN = "\033[92m"
RED = "\033[91m"
YELLOW = "\033[93m"
DARKCYAN = "\033[36m"
WHITE = "\033[97m"
RESET = "\033[0m"

if len(sys.argv) < 4:
    print(RED + "[-] Format error. Proper syntax:" + RESET)
    print(DARKCYAN + "    nexus " + YELLOW + "<agent_name> \"<your_custom_orders>\" <target_file> [save]\n" + RESET)
    sys.exit(1)

agent_name = sys.argv[1].lower()
prompt = sys.argv[2]
target_file = sys.argv[3]

save_output = True if len(sys.argv) >= 5 and sys.argv[4].lower() == "save" else False

try:
    with open(target_file, 'r', encoding='utf-8') as f:
        file_content = f.read()
except Exception as e:
    print(RED + f"[-] Error reading file '{target_file}': {e}" + RESET)
    sys.exit(1)

print(DARKCYAN + f"[*] Nexus is routing data to {agent_name.upper()}..." + RESET)

full_prompt = f"{prompt}\n\n[TARGET DATA]:\n{file_content}"

try:
    result = subprocess.run(['ollama', 'run', agent_name, full_prompt], capture_output=True, text=True, encoding='utf-8')
    output = result.stdout.strip()

    print(GREEN + f"\n[+] {agent_name.upper()} RESPONSE:" + RESET)
    print(WHITE + output + RESET + "\n")

    if save_output:
        base_dir = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
        reports_dir = os.path.join(base_dir, "Agent_Reports")
        
        os.makedirs(reports_dir, exist_ok=True)
        
        timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
        report_filename = f"{agent_name.capitalize()}_Report_{timestamp}.txt"
        report_path = os.path.join(reports_dir, report_filename)
        
        with open(report_path, "w", encoding="utf-8") as rf:
            rf.write(f"=== PROJECT ARGUS CLASSIFIED REPORT ===\n")
            rf.write(f"AGENT: {agent_name.upper()}\n")
            rf.write(f"DATE: {datetime.now().strftime('%Y-%m-%d %H:%M:%S')}\n")
            rf.write(f"TARGET: {target_file}\n")
            rf.write(f"DIRECTIVE: {prompt}\n")
            rf.write("="*40 + "\n\n")
            rf.write(output)
            
        print(YELLOW + f"[*] Report securely saved to: Argus\\Agent_Reports\\{report_filename}" + RESET)

except FileNotFoundError:
    print(RED + "[-] Critical Error: Ollama core engine not found." + RESET)
except Exception as e:
    print(RED + f"[-] System fault: {e}" + RESET)