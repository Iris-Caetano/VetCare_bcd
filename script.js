const tableDescriptions = {
  tutores: "Armazena os dados dos responsáveis pelos animais, como nome, telefone, e-mail e referência ao endereço.",
  enderecos: "Guarda os dados de endereço em campos próprios, permitindo associá-los aos tutores.",
  animais: "Registra os animais atendidos, incluindo tutor responsável, nome, espécie, raça e data de nascimento.",
  especialidades: "Mantém a lista de especialidades veterinárias disponíveis no sistema.",
  veterinarios: "Registra os profissionais, seus dados de identificação e a especialidade relacionada.",
  consultas: "Armazena os atendimentos, relacionando animal e veterinário, além de data, status e observações.",
  servicos: "Mantém o catálogo de serviços oferecidos e seus preços.",
  consultas_servicos: "Relaciona consultas e serviços, registrando quantidade e valor unitário. A restrição UNIQUE na combinação consulta-serviço evita duplicar o mesmo serviço na mesma consulta, caso essa seja a regra adotada."
};

const tableDetail = document.getElementById("tableDetail");
const tableCards = document.querySelectorAll(".table-card");

tableCards.forEach((card) => {
  card.addEventListener("click", () => {
    tableCards.forEach((item) => item.classList.remove("active"));
    card.classList.add("active");
    const tableName = card.dataset.table;
    tableDetail.innerHTML = `<strong>${tableName}</strong><p>${tableDescriptions[tableName]}</p>`;
  });
});

const menuToggle = document.getElementById("menuToggle");
const mainNav = document.getElementById("mainNav");

menuToggle.addEventListener("click", () => {
  const isOpen = mainNav.classList.toggle("open");
  menuToggle.setAttribute("aria-expanded", String(isOpen));
  menuToggle.setAttribute("aria-label", isOpen ? "Fechar menu" : "Abrir menu");
});

mainNav.querySelectorAll("a").forEach((link) => {
  link.addEventListener("click", () => {
    mainNav.classList.remove("open");
    menuToggle.setAttribute("aria-expanded", "false");
    menuToggle.setAttribute("aria-label", "Abrir menu");
  });
});
