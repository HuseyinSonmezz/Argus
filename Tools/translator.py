import sys
import logging
import warnings
from colorama import init, Fore

warnings.filterwarnings("ignore")
logging.getLogger().setLevel(logging.ERROR)
logging.getLogger("argostranslate").setLevel(logging.ERROR)
logging.getLogger("stanza").setLevel(logging.ERROR)

init(autoreset=True)

def translate_offline(target_lang, text):
    try:
        import argostranslate.package
        import argostranslate.translate

        from_code = 'tr' if target_lang == 'en' else 'en'
        to_code = target_lang

        installed_languages = argostranslate.translate.get_installed_languages()
        
        from_lang = next((lang for lang in installed_languages if lang.code == from_code), None)
        to_lang = next((lang for lang in installed_languages if lang.code == to_code), None)

        if from_lang and to_lang:
            translation = from_lang.get_translation(to_lang)
            result = translation.translate(text)
            
            print(Fore.CYAN + f"[{from_code.upper()} -> {to_code.upper()}] " + Fore.WHITE + result)
            
        else:
            print(Fore.RED + f"[-] Çevrimdışı dil paketleri bulunamadı!")
            
    except Exception as e:
        print(Fore.RED + f"[-] Hata: {e}")

if __name__ == "__main__":
    if len(sys.argv) > 2:
        lang = sys.argv[1]
        input_text = " ".join(sys.argv[2:])
        translate_offline(lang, input_text)