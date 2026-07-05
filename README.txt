====================================================================
                   PROJECT ARGUS - WARNINGS
====================================================================
0. Don’t expect a standard, polite AI. Each agent’s mindset is aggressively tailored to its specific job description. All agents except Zenith are uncensored!

1. ZENITH: Although it is based on “Llama-3.1,” the Modelfile 
  has been strictly coded in Turkish to think entirely in Turkish, perform analyses in Turkish, and exhibit a Stoic/Machiavellian 
  character.

* Modification: If you wish to change the agents’ behavior, you can open and edit the Modelfiles 
in the “System\Agents_Files” directory using a text editor, and then 
recompile the agents via Ollama.

2. TRANSLATION ENGINE AND LIMITATIONS (Argos Translate)
The local translation engine, established to ensure the system’s complete confidentiality, 
supports only two language packs:
- English -> Turkish (toTR command)
- Turkish → English (toEN command)
The system does not include dictionary weights for German, Russian, or other languages. 
If these languages are required, the .argosmodel files must be downloaded via the Argos package manager or 
manually and injected into the “Tools” folder.
-However, the Janus is a general-purpose translator; you can translate any text into any language with a well-crafted prompt.

3. FILE READING AND FORMAT SUPPORT (Nexus)
The “nexus” agent can directly read all text-based 
files such as .txt, .csv, .sql, .log, and .py.
Binary and compressed formats such as PDF, DOCX, and XLSX are not supported. The data contained in such 
files must be manually copied and pasted into a .txt file 
and fed into the system in that format.

4. HARDWARE AND PRIVACY
The system does not send your data to any cloud servers. Therefore, 
the agents’ text-generation speed, analysis capacity, and the system’s overall performance 
depend 100% on the RAM and GPU power of your personal computer. 

[HARDWARE REQUIREMENTS]
* Minimum System:
  - RAM: 8 GB (DDR4/DDR5)
  - GPU: Integrated graphics card or via the CPU.
  - Storage: At least 15 GB of free space (SSD required).

* Recommended System (For Operational and Smooth Use):
  - RAM: 16 GB or higher.
  - GPU: NVIDIA RTX series (discrete graphics card with at least 6 GB of VRAM). 
  - Storage: NVMe M.2 SSD.

* Note: Since the system uses the Ollama infrastructure, models are loaded into memory (RAM/VRAM). 
If your system does not have sufficient memory, you will receive an “Out of Memory” error 
or the agents will stop responding.
====================================================================
Created by Yafes.