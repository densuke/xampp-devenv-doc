# Configuration file for the Sphinx documentation builder.
#
# For the full list of built-in configuration values, see the documentation:
# https://www.sphinx-doc.org/en/master/usage/configuration.html

# -- Project information -----------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#project-information
import pytz
from datetime import datetime

project = 'Webアプリケーション開発 学習用コンテナについて'
copyright = '2024, 佐藤 大輔'
author = '佐藤 大輔'

# -- General configuration ---------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#general-configuration

extensions = [
    'myst_parser',
    'sphinx_copybutton'
    ]

templates_path = ['_templates']
exclude_patterns = []

language = 'ja'

# -- Options for HTML output -------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#options-for-html-output

html_theme = 'sphinx_rtd_theme'
html_static_path = ['_static']

myst_enable_extensions = [
    "deflist",
    "tasklist",
    "attrs_inline",
]

copybutton_prompt_is_regexp = True
copybutton_prompt_text = r"^PS.*> +|^\$ +"

add_function_parentheses = True
add_module_names = True

jst = pytz.timezone('Asia/Tokyo')
now = datetime.now(jst)

html_last_updated_fmt = '%Y-%m-%d %H:%M'
today_fmt = now.strftime(html_last_updated_fmt)
