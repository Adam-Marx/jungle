describe("Product details page", () => {
  beforeEach(() => {
    cy.visit("/");
  });

  it("Navigates to product details page", () => {
    cy.get(".products article")
      .first()
      .find("a")
      .click();

    cy.url().should("include", "/products/");
    cy.get("h1").should("contain", "Scented Blade");
  });
});
