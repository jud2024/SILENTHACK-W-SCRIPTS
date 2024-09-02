import streamlit as st
import pandas as pd
import numpy as np

# Título do aplicativo
st.title("Meu Primeiro App no Streamlit")

# Texto de introdução
st.write("Este é um exemplo básico de um aplicativo Streamlit.")

# Criando um gráfico interativo
chart_data = pd.DataFrame(
    np.random.randn(20, 3),
    columns=['A', 'B', 'C']
)

st.line_chart(chart_data)

# Adicionando um slider
x = st.slider('Selecione um valor para X', 0, 100, 50)
st.write(f"O valor de X é {x}")

# Adicionando uma entrada de texto
name = st.text_input("Qual é o seu nome?")
st.write(f"Olá, {name}!")

# Adicionando um botão
if st.button('Clique aqui'):
    st.write("Botão clicado!")
else:
    st.write("Clique no botão para ver algo acontecer.")

# Adicionando uma imagem
st.image("https://streamlit.io/images/brand/streamlit-logo-primary-colormark-darktext.png", caption="Imagem exemplo do Streamlit", use_column_width=True)
